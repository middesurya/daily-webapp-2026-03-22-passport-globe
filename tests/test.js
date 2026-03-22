/**
 * Passport Globe — Basic Tests
 * Run with: node tests/test.js
 *
 * These tests validate the HTML structure, data integrity,
 * and key features of the Passport Globe webapp.
 */

const fs = require('fs');
const path = require('path');

let passed = 0;
let failed = 0;

function test(name, fn) {
    try {
        fn();
        console.log(`  ✅ ${name}`);
        passed++;
    } catch (e) {
        console.log(`  ❌ ${name}: ${e.message}`);
        failed++;
    }
}

function assert(condition, message) {
    if (!condition) throw new Error(message || 'Assertion failed');
}

const htmlPath = path.join(__dirname, '..', 'index.html');
const html = fs.readFileSync(htmlPath, 'utf-8');

console.log('\n🌍 Passport Globe — Test Suite\n');

// Test 1: HTML Structure
test('HTML file exists and is not empty', () => {
    assert(html.length > 1000, 'HTML file is too small');
});

// Test 2: Required CDN dependencies
test('D3.js v7 CDN is included', () => {
    assert(html.includes('d3@7'), 'Missing D3.js v7 CDN');
});

test('TopoJSON v3 CDN is included', () => {
    assert(html.includes('topojson-client@3'), 'Missing TopoJSON v3 CDN');
});

// Test 3: World data source
test('World atlas TopoJSON source is referenced', () => {
    assert(
        html.includes('world-atlas') || html.includes('countries-110m') || html.includes('countries-50m'),
        'Missing world atlas data source'
    );
});

// Test 4: Key passport countries are in the data
test('Contains visa data for major passport countries', () => {
    const countries = ['United States', 'Japan', 'United Kingdom', 'Germany', 'India', 'China'];
    let found = 0;
    for (const c of countries) {
        if (html.includes(c)) found++;
    }
    assert(found >= 5, `Only found ${found}/6 major passport countries`);
});

// Test 5: Color coding classes exist
test('Visa status color classes are defined', () => {
    assert(html.includes('visa-free'), 'Missing visa-free class');
    assert(html.includes('visa-on-arrival'), 'Missing visa-on-arrival class');
    assert(html.includes('visa-required'), 'Missing visa-required class');
});

// Test 6: UI Elements
test('Passport selector dropdown exists', () => {
    assert(html.includes('passportSelector') || html.includes('passport-selector') || html.includes('Select'), 'Missing passport selector');
});

test('Statistics panel exists', () => {
    assert(html.includes('stat') || html.includes('Stats') || html.includes('statistics'), 'Missing statistics panel');
});

// Test 7: Responsive design
test('Has responsive media query for mobile', () => {
    assert(html.includes('@media'), 'Missing responsive media queries');
    assert(html.includes('768px') || html.includes('600px'), 'Missing mobile breakpoint');
});

// Test 8: Globe rendering
test('Globe uses orthographic projection', () => {
    assert(
        html.includes('Orthographic') || html.includes('orthographic'),
        'Missing orthographic projection for globe'
    );
});

// Test 9: Interaction
test('Globe supports drag interaction', () => {
    assert(html.includes('drag') || html.includes('Drag'), 'Missing drag interaction');
});

// Test 10: Dark theme
test('Dark theme is applied', () => {
    assert(html.includes('#0a0a1a') || html.includes('#0f0f23') || html.includes('0a0a'), 'Missing dark theme colors');
});

console.log(`\n📊 Results: ${passed} passed, ${failed} failed out of ${passed + failed} tests\n`);

process.exit(failed > 0 ? 1 : 0);
