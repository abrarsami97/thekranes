#!/bin/bash
set -e

echo "→ Creating design system file structure..."

mkdir -p tokens styles components/ui

cat > .gitignore << 'EOF'
node_modules/
.pnp
.pnp.js
.next/
out/
build/
.env
.env.local
.env.development.local
.env.test.local
.env.production.local
.DS_Store
Thumbs.db
.vscode/
.idea/
*.swp
*.swo
npm-debug.log*
yarn-debug.log*
yarn-error.log*
*.pem
.vercel
EOF

cat > tokens/colors.json << 'EOF'
{
  "brand": {
    "void":    { "value": "#010101", "role": "Primary background", "usage": "Page backgrounds, section fills" },
    "magenta": { "value": "#D02AE0", "role": "Brand action color", "usage": "CTAs, primary buttons, logo mark, card accents" },
    "cyan":    { "value": "#10DDE2", "role": "Systems & data color", "usage": "AI/automation badges, data points, secondary actions" }
  },
  "surface": {
    "s0": "#0C0C0F",
    "s1": "#131318",
    "s2": "#1A1A21",
    "s3": "#22222A",
    "s4": "#2E2E38"
  },
  "text": {
    "primary":   "#F0EFF5",
    "secondary": "#A09FB0",
    "muted":     "#55546A"
  },
  "magenta_tints": {
    "100": "rgba(208,42,224,1.00)",
    "70":  "rgba(208,42,224,0.70)",
    "40":  "rgba(208,42,224,0.40)",
    "20":  "rgba(208,42,224,0.20)",
    "12":  "rgba(208,42,224,0.12)",
    "06":  "rgba(208,42,224,0.06)"
  },
  "cyan_tints": {
    "100": "rgba(16,221,226,1.00)",
    "70":  "rgba(16,221,226,0.70)",
    "40":  "rgba(16,221,226,0.40)",
    "20":  "rgba(16,221,226,0.20)",
    "10":  "rgba(16,221,226,0.10)",
    "05":  "rgba(16,221,226,0.05)"
  },
  "semantic": {
    "border_default":   "rgba(255,255,255,0.08)",
    "border_accent_mg": "rgba(208,42,224,0.35)",
    "border_accent_cy": "rgba(16,221,226,0.30)",
    "glow_magenta":     "rgba(208,42,224,0.35)",
    "glow_cyan":        "rgba(16,221,226,0.30)"
  }
}
EOF

cat > tokens/typography.json << 'EOF'
{
  "families": {
    "display": { "name": "Syne",       "fallback": "sans-serif", "weights": [400,500,600,700,800], "usage": "Headlines, CTAs, nav logo" },
    "body":    { "name": "Figtree",    "fallback": "sans-serif", "weights": [300,400,500,600],     "usage": "Body copy, UI text, forms" },
    "mono":    { "name": "Space Mono", "fallback": "monospace",  "weights": [400,700],             "usage": "Badges, labels, code, section markers" }
  },
  "scale": {
    "display": { "size": "clamp(40px,7vw,72px)", "weight": 800, "lineHeight": 1.0,  "letterSpacing": "-0.03em" },
    "h1":      { "size": "clamp(32px,5vw,52px)", "weight": 700, "lineHeight": 1.1,  "letterSpacing": "-0.02em" },
    "h2":      { "size": "clamp(24px,3.5vw,36px)","weight": 600,"lineHeight": 1.15, "letterSpacing": "-0.015em"},
    "h3":      { "size": "clamp(18px,2.5vw,24px)","weight": 600,"lineHeight": 1.25, "letterSpacing": "-0.01em" },
    "h4":      { "size": "18px", "weight": 600, "lineHeight": 1.3,  "letterSpacing": "0" },
    "bodyLg":  { "size": "18px", "weight": 400, "lineHeight": 1.7,  "letterSpacing": "0" },
    "body":    { "size": "16px", "weight": 400, "lineHeight": 1.65, "letterSpacing": "0" },
    "bodySm":  { "size": "14px", "weight": 400, "lineHeight": 1.6,  "letterSpacing": "0" },
    "label":   { "size": "10px", "weight": 400, "lineHeight": 1.4,  "letterSpacing": "0.12em", "transform": "uppercase" },
    "caption": { "size": "12px", "weight": 500, "lineHeight": 1.5,  "letterSpacing": "0" }
  }
}
EOF

cat > tokens/spacing.json << 'EOF'
{
  "spacing": {
    "base": "4px",
    "scale": { "1":"4px","2":"8px","3":"12px","4":"16px","5":"20px","6":"24px","8":"32px","10":"40px","12":"48px","16":"64px","24":"96px","32":"128px" }
  },
  "radius": {
    "none": "0px", "xs": "4px", "sm": "8px", "md": "12px", "lg": "20px", "xl": "28px", "pill": "9999px"
  },
  "motion": {
    "easing": {
      "enter":    "cubic-bezier(0.0, 0.0, 0.2, 1.0)",
      "exit":     "cubic-bezier(0.4, 0.0, 1.0, 1.0)",
      "standard": "cubic-bezier(0.4, 0.0, 0.2, 1.0)",
      "spring":   "cubic-bezier(0.34, 1.56, 0.64, 1.0)"
    },
    "duration": { "micro":"80ms","quick":"150ms","standard":"250ms","slow":"400ms","hero":"800ms" }
  },
  "elevation": {
    "note": "No box-shadows. Elevation via border opacity and surface lightness.",
    "0": "surface-1 bg, no border",
    "1": "surface-1 bg + 8% white border",
    "2": "surface-2 bg + 10% white border",
    "3": "surface-3 bg + 12% white border",
    "glow_mg": "0 0 24px rgba(208,42,224,0.35)",
    "glow_cy": "0 0 24px rgba(16,221,226,0.30)"
  }
}
EOF

cat > tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        void: '#010101',
        magenta: { DEFAULT: '#D02AE0', hover: '#E040EF', dark: '#A020B3' },
        cyan:    { DEFAULT: '#10DDE2', hover: '#4CEBEE', dark: '#0AABB0' },
        surface: { 0:'#0C0C0F', 1:'#131318', 2:'#1A1A21', 3:'#22222A', 4:'#2E2E38' },
        ink:     { primary:'#F0EFF5', secondary:'#A09FB0', muted:'#55546A' },
      },
      fontFamily: {
        display: ['Syne', ...defaultTheme.fontFamily.sans],
        body:    ['Figtree', ...defaultTheme.fontFamily.sans],
        mono:    ['Space Mono', ...defaultTheme.fontFamily.mono],
        sans:    ['Figtree', ...defaultTheme.fontFamily.sans],
      },
      fontSize: {
        'display': ['clamp(40px,7vw,72px)',   { lineHeight:'1.0',  letterSpacing:'-0.03em', fontWeight:'800' }],
        'h1':      ['clamp(32px,5vw,52px)',   { lineHeight:'1.1',  letterSpacing:'-0.02em', fontWeight:'700' }],
        'h2':      ['clamp(24px,3.5vw,36px)', { lineHeight:'1.15', letterSpacing:'-0.015em',fontWeight:'600' }],
        'h3':      ['clamp(18px,2.5vw,24px)', { lineHeight:'1.25', letterSpacing:'-0.01em', fontWeight:'600' }],
        'h4':      ['18px', { lineHeight:'1.3', fontWeight:'600' }],
        'body-lg': ['18px', { lineHeight:'1.7' }],
        'body':    ['16px', { lineHeight:'1.65' }],
        'body-sm': ['14px', { lineHeight:'1.6' }],
        'label':   ['10px', { lineHeight:'1.4', letterSpacing:'0.12em' }],
        'caption': ['12px', { lineHeight:'1.5' }],
      },
      spacing: {
        '1':'4px','2':'8px','3':'12px','4':'16px','5':'20px',
        '6':'24px','8':'32px','10':'40px','12':'48px','16':'64px','24':'96px','32':'128px',
      },
      borderRadius: {
        'none':'0','xs':'4px','sm':'8px','md':'12px','lg':'20px','xl':'28px','pill':'9999px',
      },
      boxShadow: {
        'glow-mg':    '0 0 24px rgba(208,42,224,0.35)',
        'glow-mg-lg': '0 0 48px rgba(208,42,224,0.25), 0 0 96px rgba(208,42,224,0.12)',
        'glow-cy':    '0 0 24px rgba(16,221,226,0.30)',
        'none': 'none',
      },
      transitionTimingFunction: {
        'enter':    'cubic-bezier(0.0, 0.0, 0.2, 1.0)',
        'exit':     'cubic-bezier(0.4, 0.0, 1.0, 1.0)',
        'standard': 'cubic-bezier(0.4, 0.0, 0.2, 1.0)',
        'spring':   'cubic-bezier(0.34, 1.56, 0.64, 1.0)',
      },
      transitionDuration: {
        'micro':'80ms','quick':'150ms','standard':'250ms','slow':'400ms','hero':'800ms',
      },
      keyframes: {
        'fade-up':    { '0%':{ opacity:'0', transform:'translateY(16px)' }, '100%':{ opacity:'1', transform:'translateY(0)' } },
        'fade-in':    { '0%':{ opacity:'0' }, '100%':{ opacity:'1' } },
        'glow-pulse': { '0%,100%':{ opacity:'0.4' }, '50%':{ opacity:'0.8' } },
      },
      animation: {
        'fade-up':    'fade-up 0.5s cubic-bezier(0.0,0.0,0.2,1.0) forwards',
        'fade-in':    'fade-in 0.3s cubic-bezier(0.0,0.0,0.2,1.0) forwards',
        'glow-pulse': 'glow-pulse 3s ease-in-out infinite',
      },
      backgroundImage: {
        'gradient-mg-cy': 'linear-gradient(135deg, #D02AE0, #10DDE2)',
        'top-accent':     'linear-gradient(90deg, transparent, rgba(208,42,224,0.7), rgba(16,221,226,0.6), transparent)',
        'card-accent':    'linear-gradient(180deg, #D02AE0, #10DDE2)',
      },
      maxWidth: { 'site':'1200px', 'narrow':'800px', 'xs':'400px' },
    },
  },
  plugins: [],
}
EOF

cat > styles/globals.css << 'EOF'
@import url('https://fonts.googleapis.com/css2?family=Syne:wght@400;500;600;700;800&family=Figtree:wght@300;400;500;600&family=Space+Mono:ital,wght@0,400;0,700;1,400&display=swap');

:root {
  --color-void:     #010101;
  --color-magenta:  #D02AE0;
  --color-cyan:     #10DDE2;
  --surface-0:      #0C0C0F;
  --surface-1:      #131318;
  --surface-2:      #1A1A21;
  --surface-3:      #22222A;
  --surface-4:      #2E2E38;
  --text-primary:   #F0EFF5;
  --text-secondary: #A09FB0;
  --text-muted:     #55546A;
  --mg-100: rgba(208,42,224,1.00); --mg-70: rgba(208,42,224,0.70);
  --mg-40:  rgba(208,42,224,0.40); --mg-20: rgba(208,42,224,0.20);
  --mg-12:  rgba(208,42,224,0.12); --mg-06: rgba(208,42,224,0.06);
  --cy-100: rgba(16,221,226,1.00); --cy-70: rgba(16,221,226,0.70);
  --cy-40:  rgba(16,221,226,0.40); --cy-20: rgba(16,221,226,0.20);
  --cy-10:  rgba(16,221,226,0.10); --cy-05: rgba(16,221,226,0.05);
  --border-default: rgba(255,255,255,0.08);
  --border-subtle:  rgba(255,255,255,0.05);
  --border-strong:  rgba(255,255,255,0.14);
  --border-magenta: rgba(208,42,224,0.35);
  --border-cyan:    rgba(16,221,226,0.30);
  --glow-magenta:   0 0 24px rgba(208,42,224,0.35);
  --glow-magenta-lg:0 0 48px rgba(208,42,224,0.25), 0 0 96px rgba(208,42,224,0.12);
  --glow-cyan:      0 0 24px rgba(16,221,226,0.30);
  --font-display: 'Syne', sans-serif;
  --font-body:    'Figtree', sans-serif;
  --font-mono:    'Space Mono', monospace;
  --sp-1:4px; --sp-2:8px; --sp-3:12px; --sp-4:16px; --sp-5:20px;
  --sp-6:24px;--sp-8:32px;--sp-10:40px;--sp-12:48px;--sp-16:64px;--sp-24:96px;
  --r-xs:4px;--r-sm:8px;--r-md:12px;--r-lg:20px;--r-xl:28px;--r-pill:9999px;
  --ease-enter:    cubic-bezier(0.0,0.0,0.2,1.0);
  --ease-exit:     cubic-bezier(0.4,0.0,1.0,1.0);
  --ease-standard: cubic-bezier(0.4,0.0,0.2,1.0);
  --ease-spring:   cubic-bezier(0.34,1.56,0.64,1.0);
  --dur-micro:80ms;--dur-quick:150ms;--dur-standard:250ms;--dur-slow:400ms;--dur-hero:800ms;
}

*,*::before,*::after { box-sizing:border-box; margin:0; padding:0; }

html {
  font-size: 16px;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-rendering: optimizeLegibility;
}

body {
  background-color: var(--color-void);
  color: var(--text-primary);
  font-family: var(--font-body);
  line-height: 1.65;
}

.btn {
  display: inline-flex; align-items: center; gap: var(--sp-2);
  font-family: var(--font-display); font-size: 14px; font-weight: 600;
  letter-spacing: 0.01em; padding: 11px 24px; border-radius: var(--r-sm);
  border: none; cursor: pointer; text-decoration: none;
  transition: all var(--dur-quick) var(--ease-standard);
}
.btn-primary   { background: var(--color-magenta); color: #fff; box-shadow: var(--glow-magenta); }
.btn-primary:hover { background: #E040EF; box-shadow: var(--glow-magenta-lg); transform: translateY(-1px); }
.btn-secondary { background: var(--cy-10); color: var(--color-cyan); border: 0.5px solid var(--border-cyan); }
.btn-ghost     { background: rgba(255,255,255,0.04); color: var(--text-secondary); border: 0.5px solid var(--border-default); }

.badge { display:inline-flex;align-items:center;font-family:var(--font-mono);font-size:9px;letter-spacing:0.08em;text-transform:uppercase;padding:3px 10px;border-radius:var(--r-pill); }
.badge-magenta { background:var(--mg-12);color:var(--color-magenta);border:0.5px solid var(--border-magenta); }
.badge-cyan    { background:var(--cy-10);color:var(--color-cyan);border:0.5px solid var(--border-cyan); }
.badge-neutral { background:rgba(255,255,255,0.06);color:var(--text-secondary);border:0.5px solid var(--border-default); }

.card { background:var(--surface-1);border:0.5px solid var(--border-default);border-radius:var(--r-md);padding:var(--sp-6);position:relative;transition:border-color var(--dur-standard) var(--ease-standard); }
.card-accent { overflow:hidden; }
.card-accent::before { content:'';position:absolute;top:0;left:0;width:2px;bottom:0;background:linear-gradient(180deg,var(--color-magenta),var(--color-cyan)); }

.input { background:var(--surface-2);border:0.5px solid var(--border-default);color:var(--text-primary);border-radius:var(--r-sm);padding:10px 14px;font-family:var(--font-body);font-size:14px;width:100%;outline:none;transition:border-color var(--dur-quick) var(--ease-standard); }
.input:focus { border-color:var(--border-magenta);box-shadow:0 0 0 3px var(--mg-06); }

.nav { display:flex;align-items:center;padding:0 var(--sp-8);height:60px;border-bottom:0.5px solid var(--border-subtle);background:rgba(1,1,1,0.85);backdrop-filter:blur(12px);position:sticky;top:0;z-index:100; }
.nav-logo { font-family:var(--font-display);font-size:16px;font-weight:800;color:var(--text-primary);letter-spacing:-0.02em;text-decoration:none; }
.nav-logo span { color:var(--color-magenta); }

.container { max-width:1200px;margin:0 auto;padding:0 var(--sp-8); }
.section    { padding:var(--sp-24) 0; }

::selection { background:var(--mg-20);color:var(--text-primary); }
:focus-visible { outline:2px solid var(--color-magenta);outline-offset:3px; }
::-webkit-scrollbar { width:6px;height:6px; }
::-webkit-scrollbar-track { background:var(--surface-1); }
::-webkit-scrollbar-thumb { background:var(--surface-4);border-radius:var(--r-pill); }
EOF

cat > README.md << 'EOF'
# The Kranes — Design System

Official design system for [thekranes.com](https://thekranes.com)
GTM & AI Automation Agency for early-stage SaaS startups.

## Stack
Next.js 14 · Tailwind CSS · Framer Motion · React Three Fiber

## Brand Colors
| Name | Hex | Role |
|---|---|---|
| Void | `#010101` | Primary background (80–90% of all surfaces) |
| Krane Magenta | `#D02AE0` | Actions — CTAs, buttons, logo mark |
| Signal Cyan | `#10DDE2` | Systems — AI/automation, data, badges |

## Fonts
- **Syne** — Display & Headlines
- **Figtree** — Body & UI
- **Space Mono** — Labels, Badges, Code

## Files
```
tokens/colors.json       Brand color tokens
tokens/typography.json   Type scale definitions
tokens/spacing.json      Spacing, radius, motion tokens
styles/globals.css       CSS custom properties + base components
tailwind.config.js       Tailwind extended with all brand tokens
```

## Design Principles
- **Precision** — engineered, not decorated
- **Signal** — one thing stands out at a time
- **Momentum** — motion has direction
- **Credibility** — numbers over adjectives

*v1.0*
EOF

echo ""
echo "✓ All files created successfully:"
find . -not -path './.git/*' -not -name '.git' | sort
EOF
