'use strict'

module.exports = {
    entry: './public/src/index.jsx',
    output: {
        filename: './public/bundle.js'
    },
    module: {
        loaders: [
            {
                test: [/.jsx$/,/.js$/],
                loader: 'babel-loader',
                exclude: /node_modules/
            }
        ]
    },
    resolve: {
        extensions: ['', '.js', '.jsx']
    }
}
