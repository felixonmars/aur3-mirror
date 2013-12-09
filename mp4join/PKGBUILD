#
# Maintainer: Herbert Knapp <herbert.knapp at edu.uni-graz.at>

pkgname=mp4join
pkgver=0.1
pkgrel=1
pkgdesc='Join MP4 files lossless'
arch=('x86_64')
url='http://pastebin.ca/raw/2494564'
license=('Freeware')
makedepends=('openssl')
depends=('ffmpeg')
options=('!strip')
source=('http://pastebin.ca/raw/2494566')
md5sums=('ac84dfd045073fa611150c88b55b57a9')
package() {
 cat 2494566 | openssl base64 -d > mp4join
 chmod 755 mp4join
 install -D -m755 ./mp4join "${pkgdir}/usr/bin/mp4join"
}