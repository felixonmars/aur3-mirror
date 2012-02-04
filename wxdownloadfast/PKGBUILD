#Contributor: figo.zhang <figo1802@gmail.com>
pkgname=wxdownloadfast 
pkgver=0.6.0
pkgrel=1
pkgdesc="An open source multi-threaded download manager."
url="http://dfast.sourceforge.net"
license="GPL"
arch=('i686' 'x86_64')
depends=('wxgtk')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://ncu.dl.sourceforge.net/project/dfast/wxDownload%20Fast/0.6.0/wxdfast_0.6.0.tar.gz)
md5sums=('05c2a71cc8f811d1ad5916fce29b7b3a')

build() {
  cd $startdir/src/wxdfast-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
