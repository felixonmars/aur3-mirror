# Contributor: Georgij Kondratjev <smpuj@bk.ru>
pkgname=rp-l2tp
pkgver=0.4
pkgrel=2
pkgdesc="A user-space implementation of L2TP"
arch=("i686" "x86_64")
url="http://sourceforge.net/projects/rp-l2tp/"
license=("GPL")
depends=(ppp)
makedepends=(gcc diffutils)
provides=("l2tpd")
conflicts=("l2tpd")
replaces=()
backup=("etc/rc.d/l2tp")
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz" "dns.patch" "rc.l2tp")
md5sums=('0e45d11cb4fa6c56cce6b1d119733ed9'
         'e9c2b43800d4ed9bc1d89c91fd6159d8'
         '03a05b70293fef7f872cadac6264a461')

build() {
	cd $startdir/src/$pkgname-$pkgver
	patch -Np1 <../dns.patch
	./configure --prefix=/usr
	make || return 1
	make RPM_INSTALL_ROOT=$startdir/pkg install
	install -Dm755 ../rc.l2tp $startdir/pkg/etc/rc.d/l2tp
}
# vim: ts=2
