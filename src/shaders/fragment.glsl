varying vec3 vPosition;
varying vec2 vUv;
varying vec3 vNormal;

uniform float uTime;

#define PI 3.14159265358979
#define MOD3 vec3(.1031, .11369, .13787)

vec3 hash33(vec3 p3) {
    p3 = fract(p3 * MOD3);
    p3 += dot(p3, p3.yxz + 19.19);
    return -1.0 + 2.0 * fract(vec3((p3.x + p3.y) * p3.z, (p3.x + p3.z) * p3.y, (p3.y + p3.z) * p3.x));
}

// Perlin noise
float pnoise(vec3 p) {
    vec3 pi = floor(p);
    vec3 pf = p - pi;
    vec3 w = pf * pf * (3.0 - 2.0 * pf);
    
    return mix(
        mix(
            mix(
                dot(pf - vec3(0.0, 0.0, 0.0), hash33(pi + vec3(0.0, 0.0, 0.0))),
                dot(pf - vec3(1.0, 0.0, 0.0), hash33(pi + vec3(1.0, 0.0, 0.0))),
                w.x
            ),
            mix(
                dot(pf - vec3(0.0, 0.0, 1.0), hash33(pi + vec3(0.0, 0.0, 1.0))),
                dot(pf - vec3(1.0, 0.0, 1.0), hash33(pi + vec3(1.0, 0.0, 1.0))),
                w.x
            ),
            w.z
        ),
        mix(
            mix(
                dot(pf - vec3(0.0, 1.0, 0.0), hash33(pi + vec3(0.0, 1.0, 0.0))),
                dot(pf - vec3(1.0, 1.0, 0.0), hash33(pi + vec3(1.0, 1.0, 0.0))),
                w.x
            ),
            mix(
                dot(pf - vec3(0.0, 1.0, 1.0), hash33(pi + vec3(0.0, 1.0, 1.0))),
                dot(pf - vec3(1.0, 1.0, 1.0), hash33(pi + vec3(1.0, 1.0, 1.0))),
                w.x
            ),
            w.z
        ),
        w.y
    );
}

void main() {
    float noise = pnoise(vec3(vPosition.z * 50.0));
    vec3 purpleColor = vec3(0.498, 0.2039, 0.8314) / vec3(0.4941, 0.4941, 0.051) * 3.0;
    vec3 color = vec3(noise) * purpleColor;
    gl_FragColor = vec4(color, 1.0);
}
