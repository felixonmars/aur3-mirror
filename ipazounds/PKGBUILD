# Contributor: Jason Seeley <jamiseeley (at) yahoo (dot) com>
pkgname=ipazounds
pkgver=3.1
_pkgver=3-1
pkgrel=1
pkgdesc="Models sound change in language by applying sound change rules to a lexicon."
arch=('any')
url="http://zounds.artefact.org.nz/"
license=('GPL')
groups=()
depends=('python2' 'pygtk')
optdepends=('ttf-gentium-plus: full IPA font')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(http://zounds.artefact.org.nz/download/$pkgname$_pkgver.tar.gz)
md5sums=('ab454d485ecc14122c02b6bb8a532411') #generate with 'makepkg -g'

build() {
  cd "$srcdir/IPA Zounds-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
  mkdir -p $pkgdir/usr/share/ipazounds
  cp -r docs examples po tests $pkgdir/usr/share/ipazounds

}

