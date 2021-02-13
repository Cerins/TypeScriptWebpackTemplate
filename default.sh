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
    \"lint\": \"npx eslint . --ext .ts\"
  },
  \"main\": \"index.js\",
  \"author\": \"\"
}"> "$PWD/package.json"

npm install --save-dev typescript @babel/core @babel/cli @babel/plugin-proposal-class-properties @babel/preset-env @babel/preset-typescript
npm install ts-loader --save-dev
npm install --save-dev webpack webpack-cli babel-loader 
npm install webpack-dev-server --save-dev
rm LICENSE
rm README.md
mkdir dist



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