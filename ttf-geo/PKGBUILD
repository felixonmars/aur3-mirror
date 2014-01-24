# Maintainer: Mike Redd <mredd@0tue0.com>
# Contributor: Mike Redd <mredd@0tue0.com>
pkgname=ttf-geo
_realname=Geo
pkgver=2
pkgrel=1
pkgdesc="Geo expresses both the directness of some of the 1920s faces and the rather disingenuous consumerist thrust of the 1980s and 1990s descendants of theirs. by: Ben Weiner"
arch=('any')
license=('OFL')
url="http://www.google.com/fonts/specimen/Geo"
_url="https://googlefontdirectory.googlecode.com/hg/ofl/geo"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("$_url/$_realname-Oblique.ttf" "$_url/$_realname-Regular.ttf" "$_url/OFL.txt")

md5sums=('6223adbbeeda62c408690358991570c8'
         '8670bc4de60dff75ce8b441fd10aae55'
         '7af955052dc3da15eccc933b8cab0a03')

build() {
  cd $srcdir
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 *.ttf $startdir/pkg/usr/share/fonts/TTF/ || return 1
  install -Dm644 *.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
