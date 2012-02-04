# Maintainer: Hüseyin Gökhan Sarı <th0th@returnfalse.net>
pkgname=ffmpegthumbnailer-gnome
pkgver=0.1
pkgrel=1
pkgdesc="A package with one file that is necessary for nautilus to generate video thumbnails with ffmpegthumbnailer."
arch=('any')
url="http://returnfalse.net/log/gnome-3-and-nautilus-video-thumbnails-with-ffmpegthumbnailer/"
license=('GPL')
depends=('ffmpegthumbnailer')
source=('ffmpeg.thumbnailer')
md5sums=('43a79ed783662ea5c99f7bc9530dd595')

build() {
  cd "$srcdir/"
  mkdir -p "$pkgdir/usr/share/thumbnailers/"
  cp "$srcdir/ffmpeg.thumbnailer" "$pkgdir/usr/share/thumbnailers/"
}

# vim:set ts=2 sw=2 et:
