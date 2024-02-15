Pre-built Raspberry Pi images with [UxPlay](https://github.com/FDH2/UxPlay) installed for AirPlay 2 Mirroring. A black screen will be displayed by default with the AirPlay Pin display in the lower right corner. You can use the `rpi-imager` to setup wifi credentials and hostname, as this last one will be the name of the airplay receiver.

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
