# Maintainer: Nyarcel <nyarcel AT SPAMFREE gmail DOT com>
# Contributor: Egon Geerardyn < egon . geerardyn @ gmail . com >
# Contributor: Yngve Inntjore Levinsen

_pkgname=matplotlib2tikz
_python=python2

pkgname=$_pkgname-git
pkgver=0.1.0.r123.g26e0696
pkgrel=1
pkgdesc='Python script for converting matplotlib figures into PGFPlots (TikZ).'
arch=('any')
url='http://github.com/nschloe/matplotlib2tikz'
license=('LGPL3')
depends=("$_python-matplotlib")
makedepends=('git')
source=("$_pkgname-git::git://github.com/nschloe/matplotlib2tikz.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname-git"
	git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname-git"
	$_python setup.py build
}

package() {
	cd "$_pkgname-git"
	$_python setup.py install --root="$pkgdir"
}
