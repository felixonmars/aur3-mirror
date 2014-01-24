# Maintainer: Mike Redd <mredd@0tue0.com>
# Contributor: Mike Redd <mredd@0tue0.com>
pkgname=ttf-pixel-berry-ltd-edition
_pkgname=Pixel_Berry_08_84_Ltd.Edition
pkgver=2
pkgrel=1
pkgdesc="Pixel Berry 08/84 Ltd.Edition True Type Font"
arch=('any')
license=('custom:free')
url="http://www.zero8production.com/fonts.php"
_url="http://www.acefreefonts.com/download-14670-"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=($_url$_pkgname.zip)

md5sums=('5ded385df49e2c54bfa3e34ef809b224')

build() {
  cd $srcdir
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 *.TTF $pkgdir/usr/share/fonts/TTF/ || return 1
}
