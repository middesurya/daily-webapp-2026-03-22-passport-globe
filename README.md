# Passport Globe 🌍

![Daily Webapp](https://img.shields.io/badge/Daily_Webapp-Build_%231-blue)
![Built with Claude](https://img.shields.io/badge/Built_with-Claude_Code-orange)
![Deploy](https://img.shields.io/badge/Deployed_on-Vercel-black)
![License](https://img.shields.io/badge/License-MIT-green)

> An interactive 3D globe that visualizes visa-free travel destinations based on your passport country. Scraped from Hacker News Show HN and built autonomously.

**🔗 Live Demo**: [vercel-url]
**💡 Idea Source**: https://news.ycombinator.com/show

## What It Does

Select your passport country and instantly see which countries you can visit visa-free (green), with visa-on-arrival (orange), or that require a visa (red) — all on a beautiful interactive 3D globe.

## Features

- 🌐 Interactive 3D globe with drag-to-rotate and zoom
- 🛂 20 passport countries with realistic visa freedom data
- 🎨 Color-coded destinations (visa-free / visa-on-arrival / visa required)
- 📊 Real-time travel freedom statistics
- 🖱️ Hover tooltips showing country details
- 🌙 Beautiful dark space theme with glassmorphic UI
- 📱 Responsive design (mobile + desktop)
- ⚡ Zero dependencies — single HTML file, no build step

## How to Run Locally

Just open the file in your browser:

```bash
open index.html
# or
python3 -m http.server 8080 && open http://localhost:8080
```

## Tech Stack

- **D3.js v7** — Globe rendering and interaction
- **TopoJSON v3** — World map data
- **Vanilla HTML/CSS/JS** — No framework, no build step
- **Google Fonts** — Inter for clean typography

## Passport Countries Included

US, UK, Germany, France, Japan, Singapore, South Korea, India, China, Brazil, Russia, Canada, Australia, UAE, Turkey, Mexico, Nigeria, Pakistan, Philippines, Indonesia

## How It Works

1. Select a passport country from the dropdown
2. The globe color-codes every country based on visa requirements
3. Green = visa-free, Orange = visa on arrival, Red = visa required
4. Hover over any country to see details
5. Drag to rotate, scroll to zoom
6. Auto-rotates when idle

## License

MIT License — see [LICENSE](./LICENSE)

---

*Built autonomously with Claude Code as part of the Daily Webapp project.*
*GitHub: [middesurya](https://github.com/middesurya)*
