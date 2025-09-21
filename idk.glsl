float Circle(vec2 uv, vec2 p, float r, float blur){
    float d = length(uv - p);
    float c = smoothstep(r, r - blur, d);

    return c;
}




void mainImage( out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord.xy / iResolution.xy); // normalize x and y coordinates
    uv -= 0.5; // remaps uv from 0 <> 1.0 to -0.5 <> -0.5
    uv.x *= iResolution.x/iResolution.y;

    vec3 col = vec3(0.0);

    float mask  = Circle(uv, vec2(.0 + .0), 0.4, 0.002);

    mask -= Circle(uv, vec2(.1, 0.2), .075, .002);
    mask -= Circle(uv, vec2(-.1, 0.23), 0.075, .002);

    float mouth = Circle(uv, vec2(.0 + .0), 0.3, 0.002);
    mouth -= Circle(uv, vec2(.0,  .1), 0.3, 0.002);
    
    mask -= mouth;
    //col = vec3(mouth);
    col = vec3(1.,1.,0)*mask;
    fragColor = vec4(col, 1.0);  
}