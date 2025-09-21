vec3 palette( float t )
{
    vec3 a = vec3(0.5, 0.5, 0.5);
    vec3 b = vec3(0.5, 0.5, 0.5);
    vec3 c = vec3(3., 3., 3.);
    vec3 d = vec3(0., 0.33, .66);
    return a + b*cos(6.28318 * (c * t + d));
}

void mainImage( out vec4 fragColor, in vec2 fragCoord) {
    vec3 finalColor = vec3(0.0);
    vec2 uv = (fragCoord * 2.0 - iResolution.xy) /iResolution.y;
    vec2 uv0 = uv;

    for (float i = 0.0; i < 3.0; i++){
    uv = fract(uv*1.5) - 0.5;
    float d = length(uv);

        vec3 col = palette(length(uv0) + iTime/4.);

    d = sin(d*8.0 + (iTime * 2.0))/8.0;
    d = abs(d);
    d = 0.04 / d;
     finalColor += col * d/4.0;
    }
    fragColor = vec4(finalColor, 1.0);    
}