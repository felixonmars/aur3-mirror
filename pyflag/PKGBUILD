# Maintainer: Your Name <youremail@domain.com>
pkgname=pyflag
pkgver=0.87
_pkgver=0.87-pre1
pkgrel=2
pkgdesc="FLAG (Forensic and Log Analysis GUI) is an advanced forensic tool for the analysis of large volumes of log files and forensic investigations."
arch=('i686')
url="http://www.pyflag.net/"
license=('GPL')
depends=('mysql-python' 'python-pexpect' 'python-dateutil')
makedepends=()
optdepends=('afflib: AFF image support'
            'geoip')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${_pkgver}.tar.bz2)

build() {
  ./configure --prefix=/usr
  make 
}

package() {
  cd ${srcdir}/${pkgname}-${_pkgver}

  make DESTDIR=${pkgdir}/ install
}

# vim:set ts=2 sw=2 et:
sha256sums=('3c4f9da07e21d50fa8d1b3a3678998d27829d2eb526eddc74f72fec83cf42824')
