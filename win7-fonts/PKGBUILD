# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=win7-fonts
pkgver=1.0
pkgrel=1
pkgdesc="All fonts from Windows7. (Now the file source is removed and you'll wait for updates)"
arch=('any')
license=('custom:Microsoft')
install=win7-fonts.install
url="http://www.microsoft.com/typography/fonts"
depends=('fontconfig' 'xorg-font-utils')
source=('Win7Fonts.7z' 'LICENSE')
md5sums=('b15ed5dc36b6c327f61066ccbea165e9' '43cc4a65cdfef98e72031917508c8a25')

build() {
  mkdir -p $pkgdir/usr/share/fonts
  mv -T $srcdir/Win7Fonts/Fonts $pkgdir/usr/share/fonts/win7 || return 1
  mkdir -p $pkgdir/usr/share/$pkgname
  install -m 644 LICENSE $pkgdir/usr/share/$pkgname/LICENSE
}
