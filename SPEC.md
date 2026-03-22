# Passport Globe — Daily Build #1

## Idea Source
- **Origin**: Hacker News Show HN — "Passport Globe: Visualize where your passport stamps permit you to travel"
- **URL**: https://news.ycombinator.com/show
- **Why this idea**: Interactive 3D globe visualizations have massive wow factor. Passport/visa data is universally relatable and the concept of seeing your "travel freedom" on a spinning globe is immediately compelling. Highly shareable.

## What It Does
An interactive 3D globe webapp where you select your passport country (or multiple for dual citizens) and instantly see which countries you can visit visa-free, with visa-on-arrival, or require a visa. The globe color-codes destinations and shows statistics about your travel freedom score.

## Target User
Travelers, digital nomads, dual citizens, and anyone curious about passport power rankings. Also useful for people planning to acquire second citizenship who want to compare travel freedom.

## Core Features (MVP Scope)
1. Interactive 3D globe with country highlighting — must have
2. Country selection (single or multiple passports) with search — must have
3. Color-coded visa requirements (visa-free, visa-on-arrival, visa required, no entry) — must have
4. Travel freedom statistics (total visa-free countries, comparison) — must have
5. Country detail panel on click (visa type, duration, notes) — nice to have

## Tech Stack
- **Frontend**: Single-file HTML + vanilla JS + CSS
- **3D Globe**: D3.js with topojson for the globe projection
- **Data**: Embedded JSON dataset of passport/visa requirements
- **Deploy**: Static file, Vercel-ready

## Success Criteria
- [ ] App runs locally by opening index.html
- [ ] Core feature works end-to-end (select passport → see globe)
- [ ] Has at least 3 basic tests
- [ ] README with screenshots/demo
- [ ] Vercel deployment config
