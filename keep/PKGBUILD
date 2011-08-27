# Contributor: Devon
pkgname=keep
pkgver=0.4.0
pkgrel=1
pkgdesc="Keep is a simple backup system for KDE."
url="http://jr.falleri.free.fr/keep/wiki/Home"
license=""
depends=(kdelibs rdiff-backup)
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://jr.falleri.free.fr/files/devel/keep/keep-$pkgver.tar.gz)
md5sums=(d9ab1f84d67900bd5fff969036fd2ddc)

build() {

cd $startdir/src/keep-$pkgver

./configure --prefix=/usr --x-include=/usr/include/xorg

make || return 1
make DESTDIR=$startdir/pkg install
}
