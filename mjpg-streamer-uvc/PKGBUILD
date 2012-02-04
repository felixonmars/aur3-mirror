# This is a mjpg-streamer PKGBUILD file modified so it does not compiles the input_gspcav1.so input_testpicture.so output_autofocus.so modules
# based upon the PKGBUILD from: Ross Melin <rdmelin@gmail.com> Tri Le <trile7@gmail.com>
# Contributor: santodelaespada <sebastianbenvenuti@gmail.com>

pkgname=mjpg-streamer-uvc
pkgver=r63
pkgrel=1
pkgdesc="Stream mjpeg frames from a webcam via http only for UVC webcams"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mjpg-streamer"
license=('GPL')
groups=(multimedia)
depends=(libjpeg)
makedepends=(gcc)
provides=(mjpeg-streamer)
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://downloads.sourceforge.net/project/mjpg-streamer/mjpg-streamer/Sourcecode/mjpg-streamer-$pkgver.tar.gz
	Makefile)
noextract=()
md5sums=('1c424b5441a2bf8379cdecd7dbebc935'
         '4a01d286a5465e62994fc8ea4731756d')
build() {
  cp "$startdir/Makefile" "$srcdir/mjpg-streamer-$pkgver"
  cd "$srcdir/mjpg-streamer-$pkgver"
  make all || return 1
  mkdir -p $pkgdir/usr/share/mjpeg-streamer/www/
  mkdir -p $pkgdir/usr/lib
  install *.so $pkgdir/usr/lib/
  install -m 644 www/* $pkgdir/usr/share/mjpeg-streamer/www/
  install -m 755 www/functions.js $pkgdir/usr/share/mjpeg-streamer/www/
  mkdir -p $pkgdir/usr/bin
  install mjpg_streamer $pkgdir/usr/bin/
  install -m 644 CHANGELOG LICENSE README start.sh $pkgdir/usr/share/mjpeg-streamer/
}

# vim:set ts=2 sw=2 et:
