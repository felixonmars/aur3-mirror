# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=gstreamer-sharp
pkgver=1.4
pkgrel=2
pkgdesc=".NET wrappers for gstreamer"
url="http://gstreamer.freedesktop.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gstreamer' 'gtk-sharp-git')
source=(http://cgit.freedesktop.org/gstreamer/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz)
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
