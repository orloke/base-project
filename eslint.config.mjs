// eslint.config.js
import { dirname } from "path";
import { fileURLToPath } from "url";
import { FlatCompat } from "@eslint/eslintrc";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const compat = new FlatCompat({
  baseDirectory: __dirname,
});

// ✅ Corrigir aqui usando import() assíncrono
const eslintConfig = async () => {
  const prettierPlugin = await import("eslint-plugin-prettier");

  return [
    ...compat.extends("next/core-web-vitals", "next/typescript"),

    {
      plugins: {
        prettier: prettierPlugin.default, // Aqui é o ponto principal
      },
      rules: {
        "prettier/prettier": "error",
      },
    },
  ];
};

export default eslintConfig();
