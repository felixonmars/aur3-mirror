# Maintainer: Francois Boulogne <fboulogne at april dot org>
# Contributor: Wido <widomaker2k7@gmail.com>
pkgname=tuxtremsplit
_pkgname=recipe-{debupstream}.0ubuntu{revno:packaging}
pkgver=4.0.0_alpha4
_build=alpha4
pkgrel=1
pkgdesc="Linux client of Xtremsplit application"
arch=('i686' 'x86_64')
url="https://launchpad.net/tuxtremsplit"
license=('GPL')
depends=('gettext' 'openssl' 'libglademm')
groups=()
source=(http://launchpad.net/tuxtremsplit/4.0.0-console/4.0.0.alpha4/+download/tuxtremsplit_4.0.0.alpha4.tar.gz)
md5sums=('166cb936ae507e08d56ad6598baed9c5')

build() {
	cd $srcdir/${_pkgname}

	python2 setup.py install --root=${pkgdir}
   	ln -s $pkgdir/usr/bin/txs $pkgdir/usr/bin/tuxtremsplit
}
