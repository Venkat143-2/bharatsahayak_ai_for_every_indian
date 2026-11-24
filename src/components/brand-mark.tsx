import { cn } from "@/lib/utils";

export function BrandMark({ className }: { className?: string }) {
  return (
    <svg
      aria-hidden="true"
      className={cn("size-10 shrink-0", className)}
      fill="none"
      viewBox="0 0 48 48"
    >
      <circle className="fill-brand-saffron" cx="24" cy="24" r="22" />
      <path className="fill-background" d="M2 24h44a22 22 0 0 1-44 0Z" />
      <path className="fill-brand-green" d="M4.3 32h39.4A22 22 0 0 1 4.3 32Z" />
      <circle className="stroke-brand-navy" cx="24" cy="23" r="8.3" strokeWidth="1.8" />
      <circle className="fill-brand-navy" cx="24" cy="23" r="1.35" />
      <path
        className="stroke-brand-navy"
        d="M24 14.8v16.4M15.8 23h16.4m-14-5.8 11.6 11.6m0-11.6L18.2 28.8"
        strokeLinecap="round"
        strokeWidth="1.25"
      />
    </svg>
  );
}