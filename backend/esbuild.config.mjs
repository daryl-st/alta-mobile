import { build } from "esbuild";

build({
  entryPoints: ["src/server.ts"],
  bundle: true,
  platform: "node",
  format: "esm",
  outdir: "dist",
  sourcemap: true,
  external: ["@prisma/client"], // don’t bundle prisma
}).catch(() => process.exit(1));
