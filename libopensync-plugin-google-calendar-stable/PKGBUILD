# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Nicolas Quienot <niQo>

pkgname=libopensync-plugin-google-calendar-stable
_realname=libopensync-plugin-google-calendar
pkgver=0.22
pkgrel=1
pkgdesc="Google Calendar plugin for OpenSync 0.2x"
url="http://www.opensync.org/"
arch=('i686' 'x86_64')
options=('!libtool')
depends=('libopensync-stable' 'python-httplib2')
license=('GPL')
source=(http://archive.ubuntu.com/ubuntu/pool/universe/libo/${_realname}/${_realname}_${pkgver}.orig.tar.gz)
sha256sums=('fc4881aec445da2ad472f9b0c226bab4e777448ee34ab3ef0eaca84101ed0f89')

build() {
  cd ${srcdir}/${_realname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_realname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

