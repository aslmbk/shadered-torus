import { Canvas } from "@react-three/fiber";
import { OrbitControls } from "@react-three/drei";
import { Scene } from "./Scene";
import { EffectComposer, Bloom } from "@react-three/postprocessing";

export const App: React.FC = () => {
  return (
    <Canvas>
      <EffectComposer>
        <Bloom intensity={1.5} radius={0.5} mipmapBlur />
      </EffectComposer>
      <color attach="background" args={["#020612"]} />
      <Scene />
      <OrbitControls />
    </Canvas>
  );
};
