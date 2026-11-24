import { z } from "zod";

export const schemeCategories = [
  "Agriculture",
  "Education",
  "Women Empowerment",
  "Healthcare",
  "Housing",
  "Financial Assistance",
  "Employment",
] as const;

export type SchemeCategory = (typeof schemeCategories)[number];

const schemeRowSchema = z.object({
  slug: z.string().min(1),
  category: z.enum(schemeCategories),
  name: z.string().min(1),
  name_hi: z.string().min(1),
  name_te: z.string().min(1),
  description: z.string().min(1),
  target_beneficiaries: z.string().min(1),
  benefits: z.array(z.string()),
  eligibility_summary: z.string().min(1),
  required_documents: z.array(z.string()),
  application_steps: z.array(z.string()),
  official_url: z.string().url(),
  official_source: z.string().min(1),
  min_age: z.number().int().nullable(),
  gender_requirement: z.string().nullable(),
  category_requirement: z.string().nullable(),
  occupation_tags: z.array(z.string()),
  rural_requirement: z.boolean(),
  verification_items: z.array(z.string()),
  demo_data: z.boolean(),
});

export type Scheme = {
  slug: string;
  category: SchemeCategory;
  name: string;
  nameHi: string;
  nameTe: string;
  description: string;
  targetBeneficiaries: string;
  benefits: string[];
  eligibilitySummary: string;
  requiredDocuments: string[];
  applicationSteps: string[];
  officialUrl: string;
  officialSource: string;
  minAge: number | null;
  genderRequirement: string | null;
  categoryRequirement: string | null;
  occupationTags: string[];
  ruralRequirement: boolean;
  verificationItems: string[];
  demoData: boolean;
};

export function parseSchemeRow(value: unknown): Scheme {
  const row = schemeRowSchema.parse(value);
  return {
    slug: row.slug,
    category: row.category,
    name: row.name,
    nameHi: row.name_hi,
    nameTe: row.name_te,
    description: row.description,
    targetBeneficiaries: row.target_beneficiaries,
    benefits: row.benefits,
    eligibilitySummary: row.eligibility_summary,
    requiredDocuments: row.required_documents,
    applicationSteps: row.application_steps,
    officialUrl: row.official_url,
    officialSource: row.official_source,
    minAge: row.min_age,
    genderRequirement: row.gender_requirement,
    categoryRequirement: row.category_requirement,
    occupationTags: row.occupation_tags,
    ruralRequirement: row.rural_requirement,
    verificationItems: row.verification_items,
    demoData: row.demo_data,
  };
}

export function schemeName(scheme: Scheme, language: "en" | "hi" | "te"): string {
  if (language === "hi") return scheme.nameHi;
  if (language === "te") return scheme.nameTe;
  return scheme.name;
}