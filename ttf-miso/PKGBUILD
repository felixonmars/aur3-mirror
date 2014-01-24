# Maintainer: Mike Redd <mredd -at- 0tue0 dot com>
# Contributor: Mike Redd <mredd -at- 0tue0 dot com>
#
pkgname=ttf-miso
pkgver=2
pkgrel=1
pkgdesc="MISO is an architectural lettering font completed in 2006 by Mårten Nettelbladt."
arch=('any')
license=('custom:free')
url="http://martennettelbladt.se/miso"
_url="http://martennettelbladt.se"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("$_url/miso-typeface-2013.zip")

md5sums=('58e9fad26b2b7d76d0cf5fd1a8b65d2c')

build() {
    cd $srcdir
    install -d $pkgdir/usr/share/fonts/TTF/
    install -Dm644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF/ || return 1
    install -Dm644 $srcdir/*.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
