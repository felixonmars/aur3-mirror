# Maintainer: Mike Redd <mredd@0tue0.com>
# Contributor: Mike Redd <mredd@0tue0.com>
pkgname=otf-laconic
_realname=laconic
pkgver=1
pkgrel=2
pkgdesc="Laconic is a typeface design meant to be dry without quite seeming parched. by: Robby Woodard"
arch=('any')
license=('OFL')
url="http://www.woodardworks.com/type13.html "
_url="http://www.woodardworks.com/$_realname.zip"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=otf.install
source=($_url)

md5sums=('474067d55dda12c8fb10aa4363fe661e')

build() {
  cd $srcdir
  install -d $pkgdir/usr/share/fonts/OTF/
  install -m644 laconic/*.otf $pkgdir/usr/share/fonts/OTF/ || return 1
  install -Dm644 laconic/*.pdf $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
