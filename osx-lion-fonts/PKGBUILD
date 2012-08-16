# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=osx-lion-fonts
pkgver=1.0
pkgrel=1
pkgdesc="All fonts from OS X Lion (Now the file source is removed and you'll wait for updates)"
arch=('any')
license=('custom')
install=osx-lion-fonts.install
url="http://www.apple.com/osx/"
depends=('fontconfig' 'xorg-font-utils')
source=('OSXLion-Fonts.7z')
md5sums=('e34bdbbf14064713e76f063b96a0ba05')

build() {
  mkdir -p $pkgdir/usr/share/fonts
  mv -T $srcdir/Fonts $pkgdir/usr/share/fonts/osx-lion || return 1
}
