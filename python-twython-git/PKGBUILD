# Maintainer: Roberto Catini <roberto.catini@gmail.com>

pkgname=python-twython-git
pkgrel=1
pkgver=0
pkgdesc="Pure Python wrapper for the Twitter API"
arch=('any')
url="https://github.com/ryanmcgrath/twython"
license=('MIT')
depends=('python-requests' 'python-requests-oauthlib')
options=(!emptydirs)

source=('git://github.com/ryanmcgrath/twython.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/twython"
	printf "0.r%s" "$(git rev-list --count HEAD)"
}

package() {
	cd "$srcdir/twython"
	python setup.py install --root="${pkgdir}/" --optimize=1
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
