# Contributor: rabyte <rabyte*gmail>

pkgname=sabacc
pkgver=1.0_beta1
pkgrel=1
pkgdesc="A card game originally found in the Star Wars universe"
arch=('any')
url="http://sabacc.sourceforge.net/"
license=('GPL3')
depends=('pygtk>=2.8' 'python-gtkmvc>=1.2.2' 'python-lxml>=1.3.6')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-${pkgver//_/-}.tar.gz)
md5sums=('0948e13dea53db38b6d64032b200e05a')

build() {
  cd $pkgname-${pkgver//_/-}

  python setup.py build || return 1
  python setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
