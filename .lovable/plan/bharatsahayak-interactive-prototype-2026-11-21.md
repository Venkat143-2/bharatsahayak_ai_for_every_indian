# BharatSahayak — interactive prototype

## What will be built

- Replace the starter screen with BharatSahayak, a polished, accessible experience for discovering Indian government schemes.
- Add English, Hindi, and Telugu interface options, with clear language switching and translated demo answers.
- Add a searchable, category-filtered scheme directory and dedicated detail pages. Clearly label sample content as demonstration data and show official links only when verified.
- Add an eligibility checker using age, state, occupation, annual family income, and optional gender/category. Explain possible matches and remaining checks without promising eligibility or approval.
- Add a dashboard for saved and recently explored schemes, language preference, and the single ongoing AI conversation.
- Add an interactive scheme assistant with suggested questions, useful demo answers, and a safe fallback when live AI is unavailable. Use scheme information as its source of truth and never claim an application was submitted or approved.

## Decisions and boundaries

- One ongoing conversation is confirmed. Message storage is still awaiting the user's choice; chat persistence and any Cloud setup will follow that answer.
- Authentication is not required for this prototype. Government schemes, eligibility, and applications remain demo/reference content; no fake government integrations or submissions.
- The brief requests Gemini preparation. Keep all AI credentials server-side and use demo answers whenever live model configuration is unavailable.

## Technical approach

- Build within the existing TanStack Start and Tailwind v4 structure, using semantic design tokens and responsive layouts.
- Keep the scheme catalog in typed local demonstration data; use a dynamic scheme-detail URL and shared matching logic.
- Use the selected storage choice for the single conversation; keep saving schemes and recents aligned with the chosen prototype storage.
- Add focused tests for eligibility matching and its non-guarantee behavior, then verify the key user flows, responsive screens, route metadata, lint, and project build.