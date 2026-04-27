
<img width="1440" height="1000" alt="image" src="https://github.com/user-attachments/assets/65cef2c5-633c-4e95-927c-8e4883b92ab2" /><div><div>

<div align="center">

<img src="https://img.shields.io/badge/JavaScript-ES6+-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"/>
<img src="https://img.shields.io/badge/Node.js-Express-339933?style=for-the-badge&logo=node.js&logoColor=white"/>
<img src="https://img.shields.io/badge/Supabase-PostgreSQL-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white"/>
<img src="https://img.shields.io/badge/OpenAI-LLM%20Enhanced-412991?style=for-the-badge&logo=openai&logoColor=white"/>
<img src="https://img.shields.io/badge/Docker-Container%20Ready-2496ED?style=for-the-badge&logo=docker&logoColor=white"/>
<img src="https://img.shields.io/badge/License-MIT-00C853?style=for-the-badge"/>

<br/>

# ⚡ Code Fix
### *Intelligent Code Analysis & Automated Fixing Tool*

**A full-stack, AI-enhanced code analysis platform that detects and automatically fixes issues across 5 programming languages using 26+ detection rules — with real-time results, Supabase backend history, LLM-powered insights, and Docker deployment.**

<br/>

[![GitHub Stars](https://img.shields.io/github/stars/ibtesaamaslam/Code-Fix?style=social)](https://github.com/ibtesaamaslam/Code-Fix/stargazers)
&nbsp;
[![GitHub Forks](https://img.shields.io/github/forks/ibtesaamaslam/Code-Fix?style=social)](https://github.com/ibtesaamaslam/Code-Fix/network/members)
&nbsp;
[![GitHub Issues](https://img.shields.io/github/issues/ibtesaamaslam/Code-Fix)](https://github.com/ibtesaamaslam/Code-Fix/issues)

</div>

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Tech Stack](#-tech-stack)
- [Features](#-features)
- [26+ Detection Rules](#-26-detection-rules)
- [API Endpoints](#-api-endpoints)
- [Database Schema](#-database-schema-supabase)
- [Analysis Engine](#-analysis-engine)
- [Project Structure](#-project-structure)
- [Quick Start](#-quick-start)
- [Environment Variables](#-environment-variables)
- [Deployment](#-deployment)
- [Browser Compatibility](#-browser-compatibility)
- [Use Cases](#-use-cases)
- [Roadmap](#-roadmap)
- [Contributing](#-contributing)
- [Author](#-author)
- [License](#-license)

---

## 🔍 Overview

**Code Fix** is a professional, full-stack code analysis application that detects and automatically fixes issues in your code across multiple programming languages. It combines a real-time client-side analysis engine with a Node.js + Express backend, Supabase database persistence, and optional LLM enhancement via OpenAI GPT-3.5/4 for advanced architectural insights beyond what regex-based detection can provide.

The system analyses your actual code input — not pre-trained responses — using 26+ language-specific detection rules categorised by severity (Critical → High → Medium → Low) and type (Security · Performance · Quality · Syntax · Logic). Every detected issue is accompanied by an automated fix, a clear explanation of what changed and why, and a before/after comparison.

> 💡 **Architecture note:** The analysis engine runs entirely client-side for speed (sub-2-second results). The Express backend handles persistence, user history, LLM enhancement, and rate limiting. When the LLM is unavailable, the system falls back gracefully to local pattern-based analysis with zero degradation to the core experience.

---

## 🧰 Tech Stack

### Frontend

| Technology | Purpose |
|-----------|---------|
| HTML5 + CSS3 | Structure and neon purple UI with animations |
| Vanilla JavaScript (ES6+) | `CodeAnalyzer` class — 26+ rule engine, real-time analysis |
| `styles.css` | Neon purple design system with hover effects and transitions |
| SF Mono / Monaco / System fonts | Code display and UI typography |

### Backend

| Technology | Version | Purpose |
|-----------|---------|---------|
| [Node.js](https://nodejs.org/) | 18+ | Runtime environment |
| [Express.js](https://expressjs.com/) | Latest | REST API server — port 3002 |
| [Supabase](https://supabase.com/) | Latest | PostgreSQL database for analysis history |
| [OpenAI SDK](https://platform.openai.com/) | Latest | GPT-3.5/4 LLM enhancement |
| Rate Limiting | via express-rate-limit | API abuse prevention |

### DevOps & Deployment

| Tool | Purpose |
|------|---------|
| Docker + Docker Compose | Containerised production deployment |
| Nginx | Reverse proxy and static file serving |
| `healthcheck.js` | Built-in health monitoring endpoint |
| `deploy.sh` / `deploy.bat` | One-command Unix and Windows deployment |
| `start.js` | Quick-start automation script |

---

## ✨ Features

### 🔍 Real-Time Code Analysis
- **Live detection engine** — analyses your actual code input on every run, not cached responses.
- **Multi-language support** — JavaScript, TypeScript, Python, Java, SQL with language-specific rule sets.
- **26+ detection rules** — comprehensive identification across all issue categories.
- **Sub-2-second results** — efficient regex-based pattern matching with minimal memory footprint.

### 🛠️ Automated Code Fixing
- **Smart fixes** — automatically applies targeted improvements for each detected issue.
- **Before/after comparison** — see exactly what changed, line by line, and why.
- **One-click copy** — copy fixed code to clipboard with visual confirmation feedback.
- **Detailed explanations** — every fix includes a plain-English description of the improvement.

### 📊 Professional Dashboard
- **Severity classification** — Critical, High, Medium, Low issue prioritisation with colour coding.
- **Category grouping** — Security, Performance, Quality, Syntax, Logic organisation.
- **Visual statistics** — colour-coded metrics, progress indicators, and issue counts.
- **Interactive UI** — hover effects, smooth animations, and professional neon purple design system.

### 🤖 LLM Enhancement (OpenAI)
- **GPT-3.5/4 integration** — advanced architectural analysis beyond regex capabilities.
- **Intelligent insights** — best practices, refactoring suggestions, and design pattern recommendations.
- **Alternative API support** — configurable custom LLM endpoints.
- **Graceful fallback** — local analysis engine activates automatically if LLM is unavailable.

### 💾 Backend Persistence (Supabase)
- **Analysis history** — every analysis saved with full metadata to PostgreSQL via Supabase.
- **User statistics** — track usage patterns, improvements, and analysis trends over time.
- **History retrieval** — access and compare previous analyses via REST API.
- **Performance metrics** — monitor analysis trends and improvement rates.

### 🔒 Security & Performance
- **Rate limiting** — configurable per-IP request limits via `express-rate-limit`.
- **Input validation** — secure handling of all code input and API parameters.
- **Error handling** — comprehensive error management with structured logging.
- **Health monitoring** — `GET /health` endpoint for uptime monitoring and container orchestration.

---

## 🎯 26+ Detection Rules

### 🔴 Security Vulnerabilities
| Rule | Languages | Severity |
|------|-----------|---------|
| SQL Injection detection | Python, JavaScript, Java, SQL | Critical |
| XSS (Cross-Site Scripting) vulnerability | JavaScript, TypeScript | Critical |
| Hard-coded secrets and API keys | All | Critical |
| Unprotected API endpoints | JavaScript, TypeScript | High |
| Authentication bypass patterns | All | Critical |
| Dynamic SQL construction | SQL, Python, Java | High |

### 🟠 Performance Issues
| Rule | Languages | Severity |
|------|-----------|---------|
| O(n²) algorithm complexity | JavaScript, Python, Java | High |
| Memory leaks and unclosed resources | JavaScript, Python, Java | High |
| Unnecessary re-computation in loops | All | Medium |
| Blocking I/O operations | JavaScript, TypeScript | High |
| `SELECT *` query inefficiency | SQL | Medium |
| Missing database query indexes | SQL | Medium |

### 🟡 Code Quality Problems
| Rule | Languages | Severity |
|------|-----------|---------|
| Missing error handling / try-catch | All | High |
| `console.log` / `print` in production | JavaScript, Python | Medium |
| Poor naming conventions | All | Low |
| Missing docstrings / JSDoc | Python, JavaScript | Low |
| TODO/FIXME comments (incomplete code) | All | Low |
| Bare `except` clause | Python | Medium |
| Line length exceeding 120 chars | All | Low |

### 🔵 Syntax & Logic Errors
| Rule | Languages | Severity |
|------|-----------|---------|
| Missing semicolons | JavaScript, TypeScript | Medium |
| Missing colons in definitions | Python | High |
| `var` vs `let`/`const` (deprecated) | JavaScript, TypeScript | Medium |
| Loose equality `==` vs strict `===` | JavaScript, TypeScript | Medium |
| Off-by-one errors in loops | All | High |
| Missing `WHERE` clause in UPDATE/DELETE | SQL | Critical |
| Null / undefined reference patterns | JavaScript, TypeScript | High |
| Indentation inconsistencies | Python | High |

---

## 🔌 API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| `POST` | `/api/analyze` | Analyse code with optional LLM enhancement |
| `GET` | `/api/history/:userId` | Get all past analyses for a user |
| `GET` | `/api/analysis/:analysisId` | Get a specific analysis result by ID |
| `GET` | `/api/stats/:userId` | User statistics and usage metrics |
| `GET` | `/health` | Health check for monitoring and Docker |

### `POST /api/analyze` — Request Body

```json
{
  "code": "string — the source code to analyse",
  "language": "javascript | typescript | python | java | sql",
  "userId": "string — optional, for history persistence",
  "useLLM": "boolean — enable OpenAI enhancement"
}
```

### `POST /api/analyze` — Response Shape

```json
{
  "issues": [
    {
      "id": "string",
      "type": "security | performance | quality | syntax | logic",
      "severity": "critical | high | medium | low",
      "message": "string",
      "line": "number",
      "fix": "string — automated fix description",
      "confidence": "number — 0 to 1"
    }
  ],
  "fixedCode": "string — full corrected source code",
  "summary": {
    "critical": 0, "high": 0, "medium": 0, "low": 0
  },
  "llmInsights": "string — optional GPT analysis",
  "analysisId": "string — Supabase record ID"
}
```

---

## 🗄️ Database Schema (Supabase)

### `analyses` table

| Column | Type | Description |
|--------|------|-------------|
| `id` | uuid | Primary key |
| `user_id` | text | User identifier |
| `language` | text | Programming language |
| `original_code` | text | Input code submitted |
| `fixed_code` | text | Auto-fixed output code |
| `issues_count` | integer | Total issues detected |
| `critical_count` | integer | Critical severity count |
| `high_count` | integer | High severity count |
| `llm_used` | boolean | Whether LLM was invoked |
| `created_at` | timestamptz | Auto-set on insert |

### Setup

```sql
-- Run in Supabase SQL Editor (supabase-schema.sql)
CREATE TABLE analyses (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id TEXT,
  language TEXT NOT NULL,
  original_code TEXT NOT NULL,
  fixed_code TEXT,
  issues_count INTEGER DEFAULT 0,
  critical_count INTEGER DEFAULT 0,
  high_count INTEGER DEFAULT 0,
  llm_used BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
```

---

## 🔬 Analysis Engine

The core `CodeAnalyzer` class in `script.js` handles all client-side detection:

```javascript
class CodeAnalyzer {
  analyzeCode(code, language) {
    const issues = [];

    // 1. Run language-specific rule set
    const rules = this.getRulesForLanguage(language);

    // 2. Apply regex pattern matching per rule
    rules.forEach(rule => {
      const matches = this.applyRule(code, rule);
      if (matches.length > 0) {
        issues.push(...matches.map(m => ({
          ...rule,
          line: m.line,
          confidence: m.confidence
        })));
      }
    });

    // 3. Sort by severity weight
    issues.sort((a, b) => severityWeight[b.severity] - severityWeight[a.severity]);

    // 4. Generate automated fixes
    const fixedCode = this.generateFixes(code, issues, language);

    return { issues, fixedCode, summary: this.summarize(issues) };
  }
}
```

### Language-Specific Detection

**JavaScript / TypeScript:** Missing semicolons, `console.log`, loose equality (`==`), `var` usage, unhandled promise rejections, XSS patterns, missing try-catch.

**Python:** Missing colons in `def`/`class`, bare `except`, missing docstrings, `print` statements, string formatting SQL injection, PEP 8 line length.

**SQL:** `SELECT *`, missing `WHERE` in `UPDATE`/`DELETE`, dynamic string concatenation, query efficiency patterns.

**Java:** Missing exception handling, null pointer patterns, coding convention violations.

**Generic (all languages):** TODO/FIXME comments, line length, code complexity indicators.

---

## 📂 Project Structure

```
Code-Fix/
│
├── index.html                   # Clean HTML entry point — empty code input
├── styles.css                   # Neon purple design system with animations
├── script.js                    # CodeAnalyzer class — 26+ detection rules
├── server.js                    # Express API server — port 3002
├── start.js                     # Quick-start automation (npm run quick-start)
├── healthcheck.js               # Health monitoring for Docker/uptime checks
│
├── package.json                 # Dependencies and npm scripts
├── .env                         # Active environment configuration
├── .env.example                 # Environment variable template
│
├── Dockerfile                   # Production Docker container
├── docker-compose.yml           # Full-stack orchestration
├── deploy.sh                    # Unix one-command deployment
├── deploy.bat                   # Windows one-command deployment
│
├── standalone.html              # Zero-dependency standalone version
├── supabase-schema.sql          # Database table creation script
│
├── README.md                    # This file
├── QUICK_START.md               # Condensed getting-started guide
├── PROJECT_COMPLETION_REPORT.md # Detailed feature analysis
├── PROJECT_STATUS.md            # Current build status
└── TROUBLESHOOTING.md           # Common issues and solutions
```

---

## 🚀 Quick Start

### ⚡ One Command (Recommended)

```bash
npm run quick-start
# Installs dependencies + starts server at http://localhost:3002
```

### Option A — Development Mode (Hot Reload)

```bash
npm install
npm run dev
# → http://localhost:3002 with auto-reload on file changes
```

### Option B — Production Mode

```bash
npm install
npm start
# → http://localhost:3002
```

### Option C — Docker

```bash
docker-compose up --build
# → http://localhost:3002 fully containerised
```

### Option D — Platform Scripts

```bash
# Linux / macOS
./start.sh

# Windows
start.bat
```

### Option E — Zero Node.js (Instant Test)

Open `standalone.html` directly in any browser for basic functionality without any installation.

---

## 🔑 Environment Variables

Create `.env` from the template:

```bash
cp .env.example .env
```

```env
# Server
PORT=3002
NODE_ENV=development

# Supabase (PostgreSQL backend)
SUPABASE_URL=https://rprxqhxtlbdkqzxgbdvg.supabase.co
SUPABASE_ANON_KEY=your_anon_key_here
DATABASE_URL=postgresql://postgres:your_password@db.rprxqhxtlbdkqzxgbdvg.supabase.co:5432/postgres

# OpenAI / LLM Enhancement
OPENAI_API_KEY=your_openai_api_key_here
LLM_MODEL=gpt-3.5-turbo    # or gpt-4

# Security
RATE_LIMIT_MAX=100          # requests per window
RATE_LIMIT_WINDOW=900000    # 15 minutes in ms
```

| Variable | Required | Source |
|----------|----------|--------|
| `SUPABASE_URL` | For history | Supabase Dashboard → Settings → API |
| `SUPABASE_ANON_KEY` | For history | Supabase Dashboard → Settings → API → anon/public |
| `DATABASE_URL` | For direct DB | Supabase Dashboard → Settings → Database |
| `OPENAI_API_KEY` | For LLM | [platform.openai.com](https://platform.openai.com) |

> The app runs fully without any environment variables — LLM falls back to local analysis, Supabase falls back to in-memory session storage.

---

## 🚢 Deployment

### Vercel

```bash
vercel --prod
```

### Netlify

```bash
netlify deploy --prod --dir=.
```

### Docker (Production)

```dockerfile
FROM nginx:alpine
COPY . /usr/share/nginx/html
EXPOSE 80
```

```bash
docker-compose up --build -d
```

### AWS S3 + CloudFront

```bash
aws s3 sync . s3://your-bucket --delete
```

### GitHub Pages

Push to the `gh-pages` branch — the static files serve directly.

### Local Static Servers

```bash
# Python
python -m http.server 8000

# Node.js
npx serve .

# PHP
php -S localhost:8000
```

---

## 🌐 Browser Compatibility

| Browser | Version | Support |
|---------|---------|---------|
| Chrome | 60+ | ✅ Recommended |
| Firefox | 55+ | ✅ Full |
| Safari | 12+ | ✅ Full (iOS included) |
| Edge | 79+ | ✅ Full |
| Opera | 47+ | ✅ Full |
| Android Chrome | Latest | ✅ Full |
| iOS Safari | Latest | ✅ Full |

---

## 🎯 Use Cases

### For Individual Developers
- **Pre-commit code review** — quick quality check before pushing to version control.
- **Learning tool** — understand common mistakes and best practices per language.
- **Debugging aid** — identify potential issues early without running the code.
- **Refactoring helper** — improve legacy code quality systematically.

### For Development Teams
- **Code standards enforcement** — consistent quality checks across all languages.
- **Security audits** — identify SQL injection, XSS, and hard-coded secrets before deployment.
- **Performance optimisation** — find O(n²) algorithms and memory leaks before production.
- **Pull request assistance** — quick pre-review analysis to catch obvious issues.

### For Education
- **Teaching tool** — demonstrate good vs bad coding practices with live examples.
- **Student assessment** — evaluate code quality in assignments across 5 languages.
- **Industry standards** — learn language-specific idioms and conventions interactively.

---

## 🗺️ Roadmap

- [ ] **Additional languages** — Go, Rust, C#, PHP, Ruby detection rule sets
- [ ] **VS Code extension** — integrate the analysis engine directly into the editor
- [ ] **GitHub Action** — run analysis as a CI/CD check on every pull request
- [ ] **Batch file analysis** — upload and analyse entire code files or zip archives
- [ ] **Team dashboard** — shared analytics across multiple users and projects
- [ ] **Custom rules** — define and save organisation-specific detection rules
- [ ] **PDF report export** — generate formatted code quality reports for stakeholders
- [ ] **WebSocket live analysis** — real-time analysis as-you-type with debounce

---

## 🤝 Contributing

```bash
# 1. Fork the repository

# 2. Clone your fork
git clone https://github.com/YOUR-USERNAME/Code-Fix.git
cd Code-Fix

# 3. Install dependencies
npm install

# 4. Create a feature branch
git checkout -b feature/add-go-language-support

# 5. Make changes and commit
git add .
git commit -m "feat: add Go language detection rules to CodeAnalyzer"

# 6. Push and open a Pull Request
git push origin feature/add-go-language-support
```

**Adding a new language:**
1. Add option to the `<select>` in `index.html`
2. Implement rules in `CodeAnalyzer.getRulesForLanguage()`
3. Add fix generation patterns in `generateFixes()`
4. Test with various code samples
5. Update this README

---

## 👤 Author

<div align="center">

**Ibtesaam Aslam**

[![GitHub](https://img.shields.io/badge/GitHub-ibtesaamaslam-181717?style=for-the-badge&logo=github)](https://github.com/ibtesaamaslam)

*Full-Stack Developer & AI Enthusiast*

</div>

---

## 📜 License

```
MIT License

Copyright (c) 2024 Ibtesaam Aslam

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```

| Permission | Status |
|-----------|--------|
| ✅ Commercial use | Allowed |
| ✅ Modification | Allowed |
| ✅ Distribution | Allowed |
| ✅ Private use | Allowed |
| ❌ Liability | No warranty provided |
| ❌ Trademark use | Not granted |

---

## 🙏 Acknowledgements

- **[Supabase](https://supabase.com/)** — for the open-source Firebase alternative powering the analysis history and statistics backend.
- **[OpenAI](https://platform.openai.com/)** — for the GPT API enabling advanced LLM-powered code insights beyond pattern matching.
- **[Express.js](https://expressjs.com/)** — for the minimal, fast Node.js web framework powering the API server.
- **[Docker](https://www.docker.com/)** — for container-based deployment that makes production hosting consistent across environments.
- The **open-source JavaScript community** — for Vanilla JS, modern CSS, and Node.js ecosystem tools this project is built on.

---

<div align="center">

**⭐ If Code Fix helped you write better code, please consider starring it on GitHub!**

[![Star on GitHub](https://img.shields.io/github/stars/ibtesaamaslam/Code-Fix?style=social)](https://github.com/ibtesaamaslam/Code-Fix)

*Built with ❤️ by [Ibtesaam Aslam](https://github.com/ibtesaamaslam) — Making your code better, one analysis at a time.*

</div>
