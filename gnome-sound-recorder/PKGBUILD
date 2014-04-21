# Maintainer: Marius Nestor <marius at softpedia dot com>

pkgname=gnome-sound-recorder
pkgver=3.12.1
pkgrel=1
pkgdesc="A utility to make simple audio recording from your GNOME desktop"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Design/Apps/SoundRecorder"
license=('GPL2.1')
depends=('gjs' 'gtk3' 'gst-plugins-base' 'gst-plugins-good' 'flac' 'opus-tools' 'libvorbis' 'lame')
makedepends=('intltool')
source=(http://ftp.acc.umu.se/pub/GNOME/sources/gnome-sound-recorder/3.12/$pkgname-$pkgver.tar.xz)
md5sums=('8b7a74f08cc458a4675eee1e67d0561f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
