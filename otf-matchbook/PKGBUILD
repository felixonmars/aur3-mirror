# Maintainer: Mike Redd <mredd@0tue0.com>
# Contributor: Mike Redd <mredd@0tue0.com>
pkgname=otf-matchbook
_realname=Matchbook
pkgver=1
pkgrel=1
pkgdesc="Matchbook Open Type Fonts"
arch=('any')
license=('SIL')
url="http://www.fontsquirrel.com/fonts/Matchbook"
_url="http://www.fontsquirrel.com/fonts/download"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=otf.install
options=(force)
source=("$_url/$_realname")

md5sums=('cdddbd74238386cce0e7211c00b38e6e')

build() {
  cd $srcdir
  install -d $pkgdir/usr/share/fonts/OTF/
  install -m644 *.otf $startdir/pkg/usr/share/fonts/OTF/ || return 1
  install -Dm644 *.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
