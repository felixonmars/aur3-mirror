# Maintainer: Renato Budinich <rennabh at gmail dot com>
pkgname=wah-plugins
pkgver=0.0.2
pkgrel=4
pkgdesc="wah ladspa plugin"
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/"
license=('GPL')
depends=('ladspa' 'gcc-libs')
makedepends=('ladspa')
provides=()
source=(http://kokkinizita.linuxaudio.org/linuxaudio/downloads/WAH-plugins-$pkgver.tar.bz2 Makefile.patch)
md5sums=('e203e3458a4cd75cc442d70b8f124db9' 'd246c93568b5989997e9c5c7b1912f4e ')

build() {
  cd "$srcdir/WAH-plugins-$pkgver"

  patch Makefile "$startdir/Makefile.patch" || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}

# vim:set ts=2 sw=2 et:
