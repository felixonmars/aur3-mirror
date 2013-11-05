# Maintainer: Roberto Catini <roberto.catini@gmail.com>

pkgname=python-requests-oauthlib
pkgrel=1
pkgver=0.4.0
pkgdesc="First-class OAuth library support for Requests"
arch=('any')
url="https://github.com/requests/requests-oauthlib"
license=('custom:ISC')
depends=('python-requests')
options=(!emptydirs)

source=("git://github.com/requests/requests-oauthlib.git#tag=v$pkgver")
md5sums=('SKIP')

package() {
	cd "$srcdir/requests-oauthlib"
	python setup.py install --root="${pkgdir}/" --optimize=1
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
