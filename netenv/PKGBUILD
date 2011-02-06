#-*-mode:sh-*-
#Contributor: Mirko Messer <mirk@chao.ch>
#Comments: maybe dont work with screen pkg from archlinux
pkgname=netenv 
pkgver=0.94
pkgrel=2
pkgdesc="netenv - multiple network environment switcher"
url="http://netenv.sf.net"
license=""
depends=(bash glibc)
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://netenv.sourceforge.net/netenv-$pkgver-3.tar.gz \
netenv pacman-netenv0.94-3.patch)
md5sums=( '0ce0f5042bbe01c80171ab4085809f97' '714ca7a7b261cb3209f9cf4550c0178a' '892c3c3dcc98261a052f6066cf5f9938' )

build() {
        mkdir -p $startdir/pkg/etc/rc.d
        mkdir -p $startdir/pkg/usr/sbin
        mkdir -p $startdir/pkg/usr/bin

	cd $startdir/src/$pkgname-$pkgver-3
        patch -p0 -i ../pacman-netenv0.94-3.patch
	make || return 1
	make DESTDIR=$startdir/pkg install
        
        cp $startdir/src/netenv $startdir/pkg/etc/rc.d/
        chmod +x $startdir/pkg/etc/rc.d/netenv
}
