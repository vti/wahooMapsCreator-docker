# WahooMapsCreator docker image

This is a Docker image for [wahooMapsCreator](https://github.com/treee111/wahooMapsCreator)

## Usage

```bash
# Help
$ ./wahoomc-cli -h

# Generate country
$ ./wahoomc-cli -co <country>

# e.g. with tags
$ ./wahoomc-cli -co <country> -tag tag-wahoo-poi.xml
```

All produced files are in `$DATA_DIR` or `./data/wahooMapsCreatorData/` if not specified. Follow
[wahooMapsCreator](https://github.com/treee111/wahooMapsCreator) instructions on how to upload it to your Wahoo.
