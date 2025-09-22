float Circle(vec2 uv, vec2 p, float r, float blur){
    float d = length(uv - p);
    float c = smoothstep(r, r - blur, d);

    return c;
}
 float Band(float t, float start, float end, float blur) {
    float step1 = smoothstep(start - blur, start + blur, t);
    float step2 = smoothstep(end + blur, end - blur, t);
    
    return step1 * step2;
 
 }
 float Rect(vec2 uv, float left, float right, float bottom, float top, float blur){
     float band1 = Band(uv.x, left, right, blur);
     float band2 = Band(uv.y, bottom, top, blur);

     return band2 * band1;
 }

float Smiley(vec2 uv, vec2 p, float size) {
    uv -= p;
    uv /= size;
    float mask  = Circle(uv, vec2(.0 + .0), 0.4, 0.002);

    mask -= Circle(uv, vec2(.1, 0.2), .075, .002);
    mask -= Circle(uv, vec2(-.1, 0.23), 0.075, .002);

    float mouth = Circle(uv, vec2(.0 + .0), 0.3, 0.002);
    mouth -= Circle(uv, vec2(.0,  .1), 0.3, 0.002);
    
    mask -= mouth;

    return mask;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord) {

    
    vec2 uv = (fragCoord.xy / iResolution.xy); // normalize x and y coordinates
    uv -= 0.5; // remaps uv from 0 <> 1.0 to -0.5 <> -0.5
    uv.x *= iResolution.x/iResolution.y;

    vec3 col = vec3(0.0);

   float mask = 0.;
   //Smiley(uv, vec2(0.), 1.);

   mask = Rect( uv, -.2, .2, -.3, .3, .001);

    col = vec3(1.,1.,1.)*mask;
    fragColor = vec4(col, 1.0);  
}