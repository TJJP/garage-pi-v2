const TerserPlugin = require("terser-webpack-plugin");

module.exports = {
  mode: 'production',
  optimization: {
  	splitChunks: {
  		chunks: 'all',
  	},
    minimize: true,
    minimizer: [new TerserPlugin()],
  },
  entry: [
    './react/entry.js'
  ],
  output: {
    path: __dirname + '/assets',
    filename: '[name].js'
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        loader: 'babel-loader',
        exclude: /node_modules/,
        options: {
          presets: ['@babel/react', '@babel/preset-env'],
          plugins: ["@babel/plugin-transform-class-properties"]
        }
      }
    ]
  },
}