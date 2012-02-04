# Contributor: Prurigro
# Maintainer: Prurigro
pkgname=twyt
pkgver=0.9.2
pkgrel=2
pkgdesc="Twyt is a  Twitter API interface for Python"
url="http://andrewprice.me.uk/projects/twyt/"
license="BSD"
depends=('python' 'python-simplejson')
source=(http://andrewprice.me.uk/projects/twyt/download/$pkgname-$pkgver.tar.gz)
md5sums=('609a094e85a3d36b89d1a3d173ebfd9d')
arch=('i686' 'x86_64')
build() {
	pushd ${srcdir}/$pkgname-$pkgver || return 1
		./setup.py install --prefix ${pkgdir}/usr || return 1
	popd || return 1
}
