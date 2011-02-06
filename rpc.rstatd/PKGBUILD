# Contributor: Chris Cooper <coopstah13@comcast.net>
# Special thanks to Mark Rosenstand <mark@borkware.net>
# He is the original creator of this, but stopped maintaining.

pkgname=rpc.rstatd
pkgver=4.0.1
pkgrel=1
pkgdesc="Linux Performance Statistics Client and Server"
arch=('i686' 'x86_64')
url="http://rstatd.sourceforge.net/"
license=('GPL2')
groups=()
depends=('glibc' 'rpcbind')
makedepends=()
optdepends=()
provides=('rup' 'rpc.rstatd' 'rsysinfo')
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://downloads.sourceforge.net/project/rstatd/rstatd/$pkgver/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('116d9a8a35656e76f16c679d0596519a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install install-man

  install -D -m 755 $startdir/rstatd \
    $startdir/pkg/etc/rc.d/rstatd
}

