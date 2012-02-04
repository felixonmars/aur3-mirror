# $Id$
# Maintainer: Michael Fellinger <m.fellinger@gmail.com>
pkgname=utu
pkgver=20070608
pkgrel=1
pkgdesc="Utu’s goal is to improve the quality of communications on the Internet by introducing cryptographic models of processes found in existing human social interactions."
url="http://savingtheinternetwithhate.com"
license="GPL"
arch=('i686')
depends=('tomsfastmath' 'libtomcrypt')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("http://utuprotocol.info/releases/${pkgname}-current.tar.gz")
md5sums=()

build() {
  cd $startdir/src
  cd `ls | sort | grep -v current | head -n 1`
  cmake . || return 1
  make || return 1
  CFLAGS="-DLTM_DESC" make DESTDIR=$startdir/pkg install
}
