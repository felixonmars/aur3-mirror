# Maintainer: Thorsten Weimann <weimann@ymail.com>

pkgname=python-specbar
pkgver=0.3
pkgrel=1
pkgdesc="Simple statusbar for spectrwm (or any other wm reading from stdin)."
arch=('any')
url="https://bitbucket.org/whitie/python-specbar"
license=('MIT')
depends=('python')
optdepends=('spectrwm: Use as statusbar.')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/p/python-specbar/python-specbar-${pkgver}.tar.gz)
md5sums=('5687301a7e8ca5867a83119666c2070c')

build() {
	cd "${srcdir}/python-specbar-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}

