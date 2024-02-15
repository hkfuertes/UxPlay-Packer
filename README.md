Pre-built Raspberry Pi images with [UxPlay](https://github.com/FDH2/UxPlay) installed for AirPlay 2 Mirroring.

### Usage
```bash
# Set Variables
export PIN=$(printf %04d ${RANDOM:0:4})
export NAME=$(hostname | tr '[:lower:]' '[:upper:]')
export SIZE=$(cat /sys/class/graphics/fb0/virtual_size | sed -e 's/,/x/g')

# Display $PIN with fbi
convert -size $SIZE xc:black -gravity southeast -pointsize 48 -draw "fill white text 50,20 '$PIN'" /tmp/default.jpg
sudo fbi -T 1 -noedit -nocomments -a -noverbose /tmp/default.jpg

# Start UxPlay
uxplay -n $NAME -nh -pin $PIN
```
> This will later be splitted into separated services...

### Build the image
```bash
docker-compose run build
```
You might want to update the base images, todo so, edit the urls in the `docker-compose.yml` file:
```yaml
...
    environment:
      - IMG_URL=https://downloads.raspberrypi.org/raspios_lite_arm64/images/raspios_lite_arm64-2023-12-11/2023-12-11-raspios-bookworm-arm64-lite.img.xz
      - MD5_URL=https://downloads.raspberrypi.org/raspios_lite_arm64/images/raspios_lite_arm64-2023-12-11/2023-12-11-raspios-bookworm-arm64-lite.img.xz.sha256
      - FILENAME=raspios-lite-arm64.img
...
```
You can visit:
- https://downloads.raspberrypi.org/raspios_lite_arm64/images/ for the 64bit images
- https://downloads.raspberrypi.org/raspios_lite_armhf/images/ for the 32bit images
