# Contributor: Guillaume Royer <perso+lp@guilro.com>

pkgname=vidiwell
pkgver=0.3.0
pkgseries=0.3
pkgrel=1
pkgdesc="Vidiwell is a text editor which automatically apply style on your text thanks to user-friendly tags. (Like in txt2tags)"
arch=('i686' 'x86_64')
url="https://launchpad.net/vidiwell"
license=('GPL')
makedepends=('vala>=0.8.1')
depends=('gtk2>=2.14')
source=(http://launchpad.net/vidiwell/$pkgseries/$pkgver/+download/$pkgname-$pkgver.tar.bz2)
build()
{
	cd $startdir/src/$pkgname-$pkgver
	./waf configure --prefix=/usr/
	./waf || return 1
	./waf --destdir=$startdir/pkg install
}
md5sums=('7dcbd3bde69f3d539c4211b556ca4847')
