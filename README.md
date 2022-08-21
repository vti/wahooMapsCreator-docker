# WahooMapsCreator docker image

This is a Docker image for [wahooMapsCreator](https://github.com/treee111/wahooMapsCreator)

1. Build the image

```bash
$ bash build.sh
```

Creates an image named wahoo-maps-creator with everything pre-installed.

2. Run the cli

```bash
# Help
$ bash wahoomc-cli.sh -h

# Generate country
$ bash wahoomc-cli.sh -co <country>

# e.g. with tags
$ bash wahoomc-cli.sh -co <country> -tag tag-wahoo-poi.xml
```

All produced files are in `./data/wahooMapsCreatorData/` directory. Follow
[wahooMapsCreator](https://github.com/treee111/wahooMapsCreator) instructions on how to upload it to your Wahoo.
