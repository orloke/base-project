"use client";

import { useState } from "react";

export const Description = () => {
  const [number, setNumber] = useState(0);
  return (
    <div className="text-white">
      <span>{process.env.NEXT_PUBLIC_FRONT_URL}</span>
      <button onClick={() => setNumber((prev) => prev + 1)}>+</button>
      <span>{number}</span>
      <button onClick={() => setNumber((prev) => prev - 1)}>-</button>
    </div>
  );
};
