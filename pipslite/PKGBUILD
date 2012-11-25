# Contributor: Gianni Vialetto <g dot vialetto at gmail dot com>

pkgname=pipslite
pkgver=1.5.0_5
_pkgrel=2
_pkgver=1.5.0 # workaround for hyphen in package version
pkgrel=1
pkgdesc="EPSON Photo Image Print System for Linux"
arch=('i686' 'x86_64')
url="http://avasys.jp/eng/linux_driver/"
license=('GPL')
depends=(gtk2 libcups)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=pipslite.install
 source=(http://linux.avasys.jp/drivers/pipslite/1.5.0-5/pipslite_1.5.0-5.tar.gz) 
noextract=()
md5sums=('6312f0f2cbd20541fbaeba2898e14020')

build() {
  cd $srcdir/$pkgname

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
