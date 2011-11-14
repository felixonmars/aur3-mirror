# Maintainer: Sergio Cambra <http://developer.berlios.de/users/runico/>
# Packager: Alir3z4 <alireza.savand with love in gmail>
pkgname=ksubtitleripper
pkgver=0.3.1
pkgrel=1
pkgdesc="KSubtitleRipper is a GUI for KDE to rip DVD subtitles."
url="http://ksubtitleripper.berlios.de"
arch=('x86_64' 'i686')
license=('GPLv2')
#depends=('php' 'mysql')
#optdepends=('')
makedepends=('make' 'gcc' 'qt')
#conflicts=()
#replaces=()
#backup=()
#install='foo.install'
source=("http://download.berlios.de/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('72142c272cb37ddc9eb81d2f6b455105')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --without-arts
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
