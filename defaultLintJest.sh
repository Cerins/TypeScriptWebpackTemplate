git clone https://github.com/microsoft/TypeScript-Babel-Starter.git
cd TypeScript-Babel-Starter
rm -rf .git



echo "const path = require('path');

module.exports = {
  entry: './src/index.ts',
  module: {
    rules: [
      {
        test: /\.ts$/,
        use: 'ts-loader',
        exclude: /node_modules/,
      },
    ],
  },
  resolve: {
    extensions: ['.ts', '.js'],
  },
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, 'dist'),
  },
  mode: 'production',
  devServer: {
    contentBase: './dist',
  },
};"> "$PWD/webpack.config.js"

echo "{
  \"name\": \"babel-typescript-sample\",
  \"version\": \"1.0.0\",
  \"license\": \"MIT\",
  \"scripts\": {
    \"build\": \"webpack\",
    \"start:dev\": \"webpack serve\",
    \"test\": \"jest\",
    \"lint\": \"npx eslint . --ext .ts\"
  },
  \"main\": \"index.js\",
  \"author\": \"\"
}"> "$PWD/package.json"

#npm install --save-dev typescript @babel/core @babel/cli @babel/plugin-proposal-class-properties @babel/preset-env @babel/preset-typescript
#npm install ts-loader --save-dev
#npm install --save-dev webpack webpack-cli babel-loader 
#npm install webpack-dev-server --save-dev
npm install --save-dev @babel/core @babel/plugin-proposal-class-properties @babel/preset-env @babel/preset-typescript @types/jest @typescript-eslint/eslint-plugin @typescript-eslint/parser 
npm install --save-dev eslint eslint-config-airbnb-base eslint-config-airbnb-typescript eslint-plugin-import eslint-plugin-jest
npm install --save-dev jest ts-jest ts-loader typescript 
npm install --save-dev webpack webpack-cli webpack-dev-server
rm LICENSE
rm README.md
#npm install --save-dev jest # jest
#npm i --save-dev @types/jest # jest 

mkdir dist
mkdir tests # For tests

echo "const SAMPLE = 1;

test('Except a constant to not change', () => {
  expect(SAMPLE).toBe(1);
});" > "$PWD/tests/sample.test.ts"

# Github tests
mkdir .github
mkdir .github/workflows

echo "name: Main CI

on: [push, pull_request]

jobs:
  check:
    runs-on: ubuntu-latest

    steps:
      # Checks-out your repository under \$GITHUB_WORKSPACE, so your job can access it
      - uses: actions/checkout@v2

      - name: Install dependencies
        run: npm install

      - name: Check lint status
        run: npm run lint

      - name: Check test status
        run: npm run test

      - name: Check build status
        run: npm run build
" > "$PWD/.github/workflows/main.yml"

# ------------------------------------------


# Linting

#npm install --save-dev eslint @typescript-eslint/parser @typescript-eslint/eslint-plugin

echo "module.exports = {
  env: {
    browser: true,
    commonjs: true,
    es2021: true,
    'jest/globals': true,
  },
  extends: [
    'airbnb-base',
    'airbnb-typescript/base',
    'plugin:@typescript-eslint/recommended',
  ],
  parser: '@typescript-eslint/parser',
  parserOptions: {
    ecmaVersion: 12,
    project: \"tsconfig.json\",
  },
  plugins: [
    '@typescript-eslint',
    'jest',
  ],
  rules: {
    'no-console': 'off',
    'max-classes-per-file': 'off',
    'no-plusplus': 'off',
    'func-names': 'off',
  },
  overrides: [
    {
      // test-specific config
      files: '*.test.ts',
      rules: {
        '@typescript-eslint/no-explicit-any': 'off',
      },
    }
  ],
};" > "$PWD/.eslintrc.js"


# --------------------------------------------------------


echo "<!DOCTYPE html>
<html>
  <head>
    <meta charset=\"utf-8\" />
    <title>Test</title>
  </head>
  <body>
    <h1>Test</h1>
    <script src=\"main.js\"></script>
  </body>
</html>" > "$PWD/dist/index.html"