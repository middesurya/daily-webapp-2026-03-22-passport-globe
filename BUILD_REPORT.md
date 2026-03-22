# Build Report — Passport Globe — 2026-03-22

## Metrics
- **Build time**: ~15 minutes (discovery: 5min, spec: 2min, build: 6min, docs/tests: 2min)
- **Lines of code**: 707 (index.html) + 88 (tests) = 795 total
- **Tests passing**: 12/12
- **Technologies used**: D3.js v7, TopoJSON v3, vanilla HTML/CSS/JS, Google Fonts
- **Complexity**: moderate (3D globe rendering, embedded data model, responsive design)

## What Went Well
- Single-file HTML approach is perfect for globe visualizations — no build step needed
- D3.js orthographic projection with drag/zoom gives excellent globe interactivity
- Dark space theme + glassmorphic sidebar looks professional and polished
- Embedded visa data means zero API dependencies — works offline
- 12 tests all pass on first run, covering structure, data, UI, and design

## What Was Hard / Bottlenecks
- Visa data accuracy: real visa data changes constantly, so embedded data is approximate
  - Resolved by using well-known passport rankings and realistic ranges
- `gh` and `vercel` CLIs not available in sandbox environment
  - Resolved by creating a deploy.sh script for Surya to run locally
- Matching TopoJSON country IDs to ISO numeric codes requires careful mapping
  - Resolved by using world-atlas standard IDs

## Learnings for Future Builds
- **Single-file HTML + CDN is the fastest path to a polished POC** — no npm, no build, no bundler
- **D3.js orthographic projection** is the go-to for interactive globe visualizations
- **Embedded JSON data** eliminates API dependencies but limits data freshness — good for POCs
- **Dark themes with glassmorphism** consistently look premium with minimal effort
- **Always include a deploy.sh** when sandbox can't authenticate to external services

## Idea Quality Assessment
- **Was the idea good?** Yes — passport/visa visualization is universally relatable and visually striking
- **Would someone use this?** Yes — travelers, digital nomads, and passport comparison enthusiasts would use this regularly
- **What would make it production-ready?**
  1. Real-time visa data from an API (e.g., Passport Index API)
  2. Multi-passport comparison mode (select 2+ passports, see combined access)
  3. Country detail panel with visa duration, requirements, and application links
  4. Share functionality (screenshot/link to specific passport view)

## Sources Scraped
- Hacker News Show HN (Passport Globe inspiration)
- X/Twitter (vibe coding / shipped projects)
- Reddit r/SideProject (micro-SaaS and travel tool ideas)
- Product Hunt (March 2026 trending launches)
- GitHub Trending (top repos today)

## Ideas Considered (Top 5)
| Rank | Idea | Score | Why Selected/Rejected |
|------|------|-------|-----------------------|
| 1 | **Passport Globe** | 45 | SELECTED — High wow factor, feasible, visually striking |
| 2 | Butterwell (recipe pricing) | 40 | Needs AI vision — too complex for single-day POC |
| 3 | Sonar (port manager) | 39 | CLI tool — less visual wow factor |
| 4 | EchoLive (read-later audio) | 38 | Needs TTS API — external dependency |
| 5 | FairSplit (expense splitter) | 32 | Too common — many existing solutions |
