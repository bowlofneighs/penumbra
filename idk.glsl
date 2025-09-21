float Circle(vec2 uv, vec2 p, float r, float blur){
    float d = length(uv - p);
    float c = smoothstep(r, r - blur, d);

    return c;
}




void mainImage( out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord.xy / iResolution.xy); // normalize x and y coordinates
    uv -= 0.5; // remaps uv from 0 <> 1.0 to -0.5 <> -0.5
    uv.x *= iResolution.x/iResolution.y;

    float c  = Circle(uv, vec2(.0 + .0), 0.4, 0.1);

    c -= Circle(uv, vec2(.1, 0.1), .075, .005);
    c -= Circle(uv, vec2(-.1, 0.1), 0.075, .005);

    fragColor = vec4(vec3(c), 1.0);  
}