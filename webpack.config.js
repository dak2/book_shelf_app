// webpack vue loader settings
// execute cmd = npm run build

const VueLoaderPlugin = require('vue-loader/lib/plugin')

module.exports = {
  mode: 'development',
  devtool: 'inline-source-map',
  entry: './app/javascript/packs/application.js',
  output: {
    path: '/Users/daichikamiyama/Desktop/develop_workspace/rails_app/book_shelf_app/dist',
    filename: 'bundle.js'
  },
  module: {
    rules: [
      {
        test: /\.vue$/,
        loader: 'vue-loader'
      },
      // this will apply to both plain `.js` files
      // AND `<script>` blocks in `.vue` files
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader'
      },
      // this will apply to both plain `.css` files
      // AND `<style>` blocks in `.vue` files
      {
        test: /\.css$/,
        use: [
          'vue-style-loader',
          'css-loader'
        ]
      }
    ]
  },
  plugins: [
    // make sure to include the plugin for the magic
    new VueLoaderPlugin()
  ],
  resolve: {
    extensions: [".vue", ".js"],
    alias: {
        "vue": "vue/dist/vue.esm.js"
    }
  }
}