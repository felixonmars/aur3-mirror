# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>

pkgname=python2-requests-oauthlib
_realname=requests-oauthlib
pkgrel=1
pkgver=0.4.2
pkgdesc="First-class OAuth library support for Requests"
arch=('any')
url="https://pypi.python.org/pypi/requests-oauthlib"
license=('custom:ISC')
depends=('python2-requests' 'python2-oauthlib')
options=(!emptydirs)

source=("https://pypi.python.org/packages/source/r/${_realname}/${_realname}-$pkgver.tar.gz")
md5sums=('df930abe3971fb418c67a8545de54661')

package() {
	cd "$srcdir/$_realname-$pkgver"
	python2 setup.py install --root="${pkgdir}/" --optimize=1
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
