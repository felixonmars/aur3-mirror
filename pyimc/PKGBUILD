# Contributor: Michael Zoech <michi.zoech+arch at gmail>
# Contributor: Andreas Pieber <anpieber at gmail>
pkgname=pyimc
pkgver=0.4.0
pkgrel=2
pkgdesc="control Pidgin and Skype via command line"
arch=('any')
url="http://github.com/crazymaik/pyimc"
license=('BSD')
depends=('python2')
optdepends=('skype' 'pidgin' 'dmenu')
makedepends=('setuptools')
install='pyimc.install'
source=(https://github.com/downloads/crazymaik/pyimc/$pkgname-$pkgver.zip)

build() {
  SRC=${srcdir}/"$pkgname-$pkgver"
  DOC=${pkgdir}/usr/share/doc/pyimc/

  echo "Installing pyimc"
  cd $SRC
  python2 setup.py build || return 1
  python2 setup.py install --root=${pkgdir} --optimize=1 || return 1

  echo "Installing docs"
  mkdir -p $DOC
  cp $SRC/CHANGELOG $DOC
  cp $SRC/LICENSE $DOC
  cp $SRC/README $DOC
}

md5sums=('631563640131d7594ea2b90824d15d8a')
