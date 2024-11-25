import { Torus } from "@react-three/drei";
import vertex from "./shaders/vertex.glsl";
import fragment from "./shaders/fragment.glsl";
import * as THREE from "three";
import { useRef } from "react";
import { useFrame } from "@react-three/fiber";

export const Scene: React.FC = () => {
  const material = useRef<THREE.ShaderMaterial>(null);

  useFrame(({ clock }) => {
    if (material.current) {
      material.current.uniforms.uTime.value = clock.getElapsedTime();
    }
  });

  return (
    <Torus args={[2, 0.7, 512, 1024]}>
      <shaderMaterial
        ref={material}
        vertexShader={vertex}
        fragmentShader={fragment}
        uniforms={{ uTime: new THREE.Uniform(0) }}
      />
    </Torus>
  );
};
