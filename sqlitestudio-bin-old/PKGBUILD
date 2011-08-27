# Maintainer: mody <modywzm at gmail dot com>
_pkgbase=sqlitestudio
pkgname=sqlitestudio-bin-old
pkgver=1.1.3
pkgrel=1
pkgdesc="Database manager for SQLite 3.x, running on Windows and Linux."
url="http://sqlitestudio.one.pl/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libxft')
provides=('${_pkgbase}')
options=(!strip)
source=("http://sqlitestudio.one.pl/files/free/stable/linux/${_pkgbase}-${pkgver}.bin")
md5sums=('9b3eca11d692269ecc07b2d050c9f4b4')

build() {
  install -Dm755 $srcdir/${_pkgbase}-${pkgver}.bin $pkgdir/usr/bin/${_pkgbase}
}