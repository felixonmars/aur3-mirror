# Maintainer: Mike Redd <mredd@0tue0.com>
# Contributor: Mike Redd <mredd@0tue0.com>
pkgname=ttf-matchbook
_pkgname=Matchbook
pkgver=2
pkgrel=1
pkgdesc="Matchbook is a simple and functional set of two typefaces we designed in a serif and sans-serif version. by: One By Four"
arch=('any')
license=('OFL')
url="http://www.onebyfourstudio.com/projects/fonts/2009/matchbook-typefaces/"
_url="http://www.onebyfourstudio.com/wp-content/uploads/2009/09"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("$_url/$_pkgname.zip" "$_url/$_pkgname-Serif.zip")

md5sums=('3e21f533f3f4e6cbca4246b7c8c1cef3'
         'b67eeb9e39bebb1b3266daa44ada4ae3')

build() {
  cd $srcdir
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 $_pkgname/*.ttf $pkgdir/usr/share/fonts/TTF/|| return 1
  install -Dm644 $_pkgname/*.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
