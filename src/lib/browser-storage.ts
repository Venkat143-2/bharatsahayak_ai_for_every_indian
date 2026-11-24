import { z } from "zod";

import { isLanguage, type Language } from "./translations";

export const storageKeys = {
  language: "bharat-sahayak:language:v1",
  savedSchemes: "bharat-sahayak:saved-schemes:v1",
  recentSchemes: "bharat-sahayak:recent-schemes:v1",
  conversation: "bharat-sahayak:conversation:v1",
} as const;

export const storedChatMessageSchema = z.object({
  id: z.string(),
  role: z.enum(["user", "assistant"]),
  parts: z.array(z.object({ type: z.literal("text"), text: z.string() })),
});

export type StoredChatMessage = z.infer<typeof storedChatMessageSchema>;

export function readStoredLanguage(): Language | null {
  if (typeof window === "undefined") return null;
  try {
    const value = window.localStorage.getItem(storageKeys.language);
    return value && isLanguage(value) ? value : null;
  } catch {
    return null;
  }
}

export function readStoredStringList(key: string): string[] {
  if (typeof window === "undefined") return [];
  try {
    const value = window.localStorage.getItem(key);
    if (!value) return [];
    const result = z.array(z.string()).safeParse(JSON.parse(value));
    return result.success ? result.data : [];
  } catch {
    return [];
  }
}

export function readStoredConversation(): StoredChatMessage[] {
  if (typeof window === "undefined") return [];
  try {
    const value = window.localStorage.getItem(storageKeys.conversation);
    if (!value) return [];
    const result = z.array(storedChatMessageSchema).safeParse(JSON.parse(value));
    return result.success ? result.data : [];
  } catch {
    return [];
  }
}

export function storeBrowserValue(key: string, value: unknown): void {
  if (typeof window === "undefined") return;
  try {
    window.localStorage.setItem(key, JSON.stringify(value));
  } catch {
    // Keep the prototype usable when browser storage is blocked or full.
  }
}