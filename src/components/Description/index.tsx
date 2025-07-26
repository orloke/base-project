"use client";

import { useState } from "react";

export const Description = () => {
  const [number, setNumber] = useState(0);
  console.log("number", number, process.env.NEXT_PUBLIC_FRONT_URL);
  return (
    <div className="text-white">
      <span>{process.env.NEXT_PUBLIC_FRONT_URL}</span>
      <span>Aqui tem que aaprecekrjsljf</span>
      <button onClick={() => setNumber((prev) => prev + 1)}>+</button>
      <span>{number}</span>
      <button onClick={() => setNumber((prev) => prev - 1)}>-</button>
    </div>
  );
};
