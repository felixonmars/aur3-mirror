# Contributor: Dhananjay <mb dot dhananjay at gmail dot com>

pkgname=payyans
pkgver=0.7
pkgrel=1
pkgdesc="ASCII to unicode conversion utility"
arch=('any')
license=('GPLv3')
url="http://wiki.smc.org.in/Payyans"
depends=('python')
makedepends=('setuptools')
source=(http://download.savannah.gnu.org/releases/smc/payyans/payyansv07.tar.gz)
md5sums=('1bd6553cc33705297effb16015a40cfd')

build() {
  cd "$srcdir/$pkgname"

	python setup.py install --root=${pkgdir} || return 1
}
