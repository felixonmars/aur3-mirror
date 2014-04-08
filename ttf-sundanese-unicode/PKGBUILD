pkgname=ttf-sundanese-unicode
pkgver=1.0.5
pkgrel=1
pkgdesc="Unicode font that provides Sundanese script"
url="http://sabilulungan.org/aksara/files/font/"
license=('unknown')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("http://sabilulungan.org/aksara/files/font/SundaneseUnicode-1.0.5.ttf")
md5sums=('38a0125b861320a5a7e43f86b567de5b')

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp "$srcdir/SundaneseUnicode-1.0.5.ttf" "$pkgdir/usr/share/fonts/TTF/"
}