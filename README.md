Upload to [img.bi](https://img.bi), and remember the image links.

## Usage

Upload all images in the current directory:

```sh
imgbir
```

"All images" means:

- All files match '*.jpg', '*.jpeg', '*.JPG', '*.JPEG', '*.png', '*.PNG', '*.gif', '*.GIF', '*.svg', '*.SVG', 'webp', 'WEBP'.
- Smaller than 3145728.

Specify image(s) to upload:

```sh
imgbir 1.jpg [2.png]
```

`imgbir` records view and remove links in `imagename.txt`.