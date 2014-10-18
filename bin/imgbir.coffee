#!/usr/bin/env coffee

require 'shelljs/global'
_ = require('underscore.string')

imgbi = require("imgbi")

upload_single_image = (image_location) ->
	options = {}
	options.image = image_location
	options.expire = "0" # Never expire.
	options.url = "https://img.bi" # url of img.bi server, https://img.bi by default
	imgbi_links_file = _.strLeftBack(options.image, '.') + '.txt'
	imgbi.upload({file: options.image, url: options.url, expire: options.expire},
		(err, result) ->
	  	if err
	    	new Error(err) # if there any error during the upload
	  	else
	  		_.join('\n', result.viewlink, result.rmlink).toEnd(imgbi_links_file) # link to view image
	)

switch process.argv.length
	when 2
		images_in_current_directory = ls('*.jpg', '*.jpeg', '*.JPG', '*.JPEG', '*.png', '*.PNG', '*.gif', '*.GIF', '*.svg', '*.SVG', 'webp', 'WEBP')
		images_in_current_directory.forEach(upload_single_image)
	when 3
		upload_single_image(process.argv[2])
	else
		process.argv[2..].forEach(upload_single_image)


