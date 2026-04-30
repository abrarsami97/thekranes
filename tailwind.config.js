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
