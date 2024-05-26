import { copyFileSync, readFileSync, writeFileSync } from 'fs';
import { execSync } from 'child_process';

try {
  // Run yarn build
  console.log('Running yarn build...');
  execSync('yarn build', { stdio: 'inherit' });

  // Copy files
  console.log('Copying files...');
  copyFileSync('dist/mino.iife.js', 'typst-package/mino.js');
  copyFileSync('dist/third-party-licenses.txt', 'typst-package/NOTICE');

  // Append licenses to NOTICE
  console.log('Appending licenses to NOTICE...');
  const licenses = readFileSync('dist/third-party-licenses.txt', 'utf8');
  writeFileSync('typst-package/NOTICE', `Dependencies:\n\n${licenses}`);

  copyFileSync('README.md', 'typst-package/README.md');
  copyFileSync('LICENSE', 'typst-package/LICENSE');

  // Run typst compile
  console.log('Compiling typst...');
  execSync('typst compile ./mino.typ mino.svg', { stdio: 'inherit' });

  // Copy mino.svg
  console.log('Copying mino.svg...');
  copyFileSync('mino.svg', 'typst-package/mino.svg');

  console.log('All tasks completed successfully!');
} catch (err) {
  console.error('An error occurred:', err);
  process.exit(1);
}
