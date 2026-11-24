import { createClient } from "@supabase/supabase-js";

import type { Database } from "@/integrations/supabase/types";
import { parseSchemeRow, type Scheme } from "./scheme-types";

export async function readPublicSchemes(): Promise<Scheme[]> {
  const databaseUrl = process.env["SUPABASE_URL"];
  const publishableKey = process.env["SUPABASE_PUBLISHABLE_KEY"];

  if (!databaseUrl || !publishableKey) {
    throw new Error("The public scheme directory is not configured.");
  }

  const client = createClient<Database>(databaseUrl, publishableKey, {
    auth: { persistSession: false, autoRefreshToken: false },
    global: {
      fetch: (input, init) => {
        const headers = new Headers(init?.headers);
        if (
          publishableKey.startsWith("sb_") &&
          headers.get("Authorization") === `Bearer ${publishableKey}`
        ) {
          headers.delete("Authorization");
        }
        headers.set("apikey", publishableKey);
        return fetch(input, { ...init, headers });
      },
    },
  });

  const { data, error } = await client
    .from("government_schemes")
    .select("*")
    .order("category", { ascending: true });

  if (error) {
    console.error("Public scheme directory query failed:", error.message);
    throw new Error("The scheme directory is temporarily unavailable.");
  }

  return data.map(parseSchemeRow);
}