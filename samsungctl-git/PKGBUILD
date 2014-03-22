# Maintainer: Lauri Niskanen <ape@ape3000.com>

pkgname=samsungctl-git
pkgver=0.2.0.c78a87a
pkgrel=1
pkgdesc="Remote control Samsung televisions via TCP/IP connection"
arch=('any')
url="https://github.com/Ape/samsungctl"
license=('MIT')
depends=('python-setuptools')
makedepends=('git')
provides=('samsungctl')
conflicts=('samsungctl')
source=("${pkgname%}::git+https://github.com/Ape/samsungctl.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}"/${pkgname}

	VERSION=$(cat samsungctl/__init__.py | grep "__version__" | cut -d'"' -f 2 | cut -d'-' -f1)
	COMMIT=$(git log --pretty=format:'%h' -n 1)
	echo "$VERSION.$COMMIT"
}

package() { 
	cd "$srcdir/$pkgname"
	mkdir -pm755 $pkgdir/usr/share/licenses/$pkgname
	cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
	mkdir -pm755 $pkgdir/etc
	cp samsungctl.conf $pkgdir/etc/
	python setup.py install --root="$pkgdir/" --optimize=1
}
