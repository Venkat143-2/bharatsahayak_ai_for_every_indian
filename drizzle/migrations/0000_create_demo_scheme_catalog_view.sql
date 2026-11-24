CREATE VIEW public.government_schemes WITH (security_invoker = true) AS
SELECT * FROM (VALUES
  (
    'pm-kisan'::text, 'Agriculture'::text, 'PM-KISAN'::text,
    'प्रधानमंत्री किसान सम्मान निधि'::text, 'ప్రధానమంత్రి కిసాన్ సమ్మాన్ నిధి'::text,
    'Income support for eligible landholding farmer families, paid directly to bank accounts in installments.'::text,
    'Landholding farmer families across India.'::text,
    ARRAY['₹6,000 per year in three installments, subject to scheme rules.']::text[],
    'Land records and current exclusion rules determine eligibility; an occupation label alone is not enough.'::text,
    ARRAY['Aadhaar details', 'Bank account details', 'Land record information', 'e-KYC information when requested by the official portal']::text[],
    ARRAY['Check the official portal for the current beneficiary and registration process.', 'Complete required e-KYC and state land-record checks.', 'Use an official help centre or Common Service Centre if needed.']::text[],
    'https://www.pmkisan.gov.in/'::text, 'PM-KISAN official portal'::text,
    NULL::integer, NULL::text, NULL::text, ARRAY['farmer', 'agricultural_worker']::text[], false::boolean,
    ARRAY['Confirm cultivable land records and family details.', 'Check exclusions and current e-KYC requirements.']::text[], true::boolean
  ),
  (
    'post-matric-sc'::text, 'Education'::text, 'Post-Matric Scholarship for SC Students'::text,
    'अनुसूचित जाति विद्यार्थियों के लिए पोस्ट-मैट्रिक छात्रवृत्ति'::text, 'ఎస్సీ విద్యార్థుల పోస్ట్-మ్యాట్రిక్ స్కాలర్‌షిప్'::text,
    'Financial assistance for eligible Scheduled Caste students studying after secondary school; current rules and amounts vary by course and state.'::text,
    'SC students enrolled in post-matric or post-secondary study.'::text,
    ARRAY['Scholarship support; amounts, course groups, and current application windows vary.']::text[],
    'Student status, caste, domicile, course, income rules, and the current state or central scheme listing must be checked.'::text,
    ARRAY['Caste certificate', 'Domicile or residence proof', 'Current education and course records', 'Income certificate if requested', 'Bank details']::text[],
    ARRAY['Open the National Scholarship Portal and locate the current matching scheme.', 'Check your domicile state, course, application dates, and document list.', 'Submit through the official portal and complete institution or state verification.']::text[],
    'https://scholarships.gov.in/'::text, 'National Scholarship Portal'::text,
    NULL::integer, NULL::text, 'SC'::text, ARRAY['student']::text[], false::boolean,
    ARRAY['Confirm the exact current scheme, domicile state, course, income conditions, and deadline.', 'Application and renewal rules can vary by state and year.']::text[], true::boolean
  ),
  (
    'pmuy'::text, 'Women Empowerment'::text, 'Pradhan Mantri Ujjwala Yojana (PMUY)'::text,
    'प्रधानमंत्री उज्ज्वला योजना (PMUY)'::text, 'ప్రధానమంత్రి ఉజ్జ్వల యోజన (PMUY)'::text,
    'LPG connection support for an adult woman in a poor household that meets the current scheme conditions.'::text,
    'Adult women in eligible poor households without an existing household LPG connection.'::text,
    ARRAY['Deposit-free LPG connection support and associated benefits listed on the official portal, subject to current rules.']::text[],
    'The applicant must be a woman aged 18 or above; the household must meet the deprivation declaration and have no other household LPG connection.'::text,
    ARRAY['KYC application', 'Applicant Aadhaar', 'Ration card or approved family-composition document', 'Bank account details', 'Address proof when Aadhaar address differs', 'Deprivation declaration']::text[],
    ARRAY['Review the current eligibility and document list on the PMUY portal.', 'Apply through the official portal or an LPG distributor; a Common Service Centre can assist.', 'Complete the distributor’s verification process.']::text[],
    'https://pmuy.gov.in/ujjwala2.html'::text, 'PMUY official portal'::text,
    18, 'female'::text, NULL::text, ARRAY[]::text[], false::boolean,
    ARRAY['Confirm household LPG connection status and poor-household declaration.', 'Use only the official application and distributor process.']::text[], true::boolean
  ),
  (
    'pmjay-senior-70'::text, 'Healthcare'::text, 'Ayushman Bharat PM-JAY: Senior Citizens 70+'::text,
    'आयुष्मान भारत PM-JAY: 70 वर्ष से अधिक आयु के वरिष्ठ नागरिक'::text, 'ఆయుష్మాన్ భారత్ PM-JAY: 70 ఏళ్లు పైబడిన వృద్ధులు'::text,
    'Health coverage for senior citizens aged 70 or above, regardless of economic status, under the official senior-citizen extension.'::text,
    'Individuals aged 70 or above.'::text,
    ARRAY['Free medical treatment coverage up to ₹5 lakh, subject to the scheme’s current terms.']::text[],
    'The senior-citizen extension applies at age 70 or above; age is checked against Aadhaar and Aadhaar-based e-KYC is required.'::text,
    ARRAY['Aadhaar for enrolment and e-KYC']::text[],
    ARRAY['Check the National Health Authority’s current senior-citizen guidance.', 'Use the official beneficiary portal or Ayushman app to complete enrolment and e-KYC.', 'Confirm treatment and hospital details through official PM-JAY channels.']::text[],
    'https://nha.gov.in/img/resources/English_FAQs_related_to_the_benefits_for_senior_citizens.pdf'::text, 'National Health Authority senior-citizen FAQ'::text,
    70, NULL::text, NULL::text, ARRAY['senior']::text[], false::boolean,
    ARRAY['Age must be 70 or above as recorded for Aadhaar-based verification.', 'Confirm current enrolment and treatment terms with the National Health Authority.']::text[], true::boolean
  ),
  (
    'pmay-g'::text, 'Housing'::text, 'Pradhan Mantri Awaas Yojana–Gramin (PMAY-G)'::text,
    'प्रधानमंत्री आवास योजना–ग्रामीण (PMAY-G)'::text, 'ప్రధానమంత్రి ఆవాస్ యోజన–గ్రామీణ (PMAY-G)'::text,
    'Rural housing assistance for households identified under the programme’s official rural selection and verification process.'::text,
    'Eligible rural households identified through official housing and deprivation criteria.'::text,
    ARRAY['Housing assistance for eligible rural households; amounts and implementation details depend on the current official guidelines and location.']::text[],
    'Eligibility depends on rural residence, household housing conditions, official selection criteria, and local verification; this profile alone cannot determine eligibility.'::text,
    ARRAY['Documents requested by the Gram Panchayat or block office during official verification; the required list varies.']::text[],
    ARRAY['Review the official PMAY-G eligibility questions.', 'Ask the Gram Panchayat or block office about household listing and verification.', 'Follow only official selection and application instructions.']::text[],
    'https://pmayg.nic.in/netiayHome/questions.html'::text, 'PMAY-G official eligibility questions'::text,
    NULL::integer, NULL::text, NULL::text, ARRAY['rural_household']::text[], true,
    ARRAY['Rural residence and housing condition are not collected by this checker.', 'Official household selection and local verification are required.']::text[], true::boolean
  ),
  (
    'pmjdy'::text, 'Financial Assistance'::text, 'Pradhan Mantri Jan-Dhan Yojana (PMJDY)'::text,
    'प्रधानमंत्री जन-धन योजना (PMJDY)'::text, 'ప్రధానమంత్రి జన్-ధన్ యోజన (PMJDY)'::text,
    'A financial-inclusion programme that helps eligible unbanked people access a basic savings bank account and related services.'::text,
    'People who do not already have a bank account and meet the bank’s KYC process.'::text,
    ARRAY['Basic savings account with no minimum balance requirement; other features are subject to official and bank conditions.']::text[],
    'The scheme is intended for people without another bank account; the bank verifies identity and current KYC requirements.'::text,
    ARRAY['Account-opening form', 'Identity and KYC documents accepted by the bank']::text[],
    ARRAY['Visit a bank branch or Bank Mitra.', 'Ask for a PMJDY basic savings account and the current KYC list.', 'Complete the bank’s identity and account-opening checks.']::text[],
    'https://www.pmjdy.gov.in/scheme'::text, 'Department of Financial Services PMJDY page'::text,
    NULL::integer, NULL::text, NULL::text, ARRAY['unbanked']::text[], false::boolean,
    ARRAY['The checker does not ask whether you already have a bank account.', 'Confirm account and KYC conditions with the bank.']::text[], true::boolean
  ),
  (
    'mgnrega'::text, 'Employment'::text, 'Mahatma Gandhi National Rural Employment Guarantee Scheme (MGNREGA)'::text,
    'महात्मा गांधी राष्ट्रीय ग्रामीण रोजगार गारंटी योजना (MGNREGA)'::text, 'మహాత్మా గాంధీ జాతీయ గ్రామీణ ఉపాధి హామీ పథకం (MGNREGA)'::text,
    'A rural employment programme that provides wage-work opportunities to eligible rural households under the Act and current local process.'::text,
    'Rural households whose adult members volunteer for unskilled manual work.'::text,
    ARRAY['Up to 100 days of wage employment per eligible rural household in a financial year, subject to the Act and current implementation rules.']::text[],
    'The household must be rural and follow the official job-card and work-demand process; this profile does not confirm registration or local availability.'::text,
    ARRAY['Job-card application and household identity or residence information requested by the Gram Panchayat.']::text[],
    ARRAY['Contact the Gram Panchayat to apply for a job card.', 'Ask for work through the official local process and retain the dated acknowledgement.', 'Check work allocation and payment status on the official portal.']::text[],
    'https://nrega.dord.gov.in/'::text, 'Ministry of Rural Development MGNREGA portal'::text,
    18, NULL::text, NULL::text, ARRAY['farmer', 'agricultural_worker', 'daily_wage_worker', 'unemployed']::text[], true,
    ARRAY['Rural residence and household job-card status are not collected by this checker.', 'Work demand, availability, and payment follow local official procedures.']::text[], true::boolean
  )
) AS schemes(
  slug, category, name, name_hi, name_te, description, target_beneficiaries,
  benefits, eligibility_summary, required_documents, application_steps,
  official_url, official_source, min_age, gender_requirement, category_requirement,
  occupation_tags, rural_requirement, verification_items, demo_data
);
GRANT SELECT ON public.government_schemes TO anon, authenticated;
GRANT ALL ON public.government_schemes TO service_role;