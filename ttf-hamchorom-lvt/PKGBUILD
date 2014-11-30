# Maintaner: Isaac914 <hojunester at gmail com>
#  Revision: 2014-10-20

pkgname=ttf-hamchorom-lvt
pkgrel=1
pkgver=1.981
pkgdesc="a modified version of the Hamchorom font family, that allows you to use yethangul in any program that supports GSUB. These modified fonts are distributed by the Korean Tex Users Group."
arch=('any')
url="http://wiki.ktug.org/wiki/wiki.php/%ED%95%A8%EC%B4%88%EB%A1%AC%EC%B2%B4LVT"
license=("custom:check http://wiki.ktug.org/wiki/wiki.php/함초롬체LVT")
depends=('fontconfig' 'xorg-font-utils')
install=ttf-hamchorom-lvt.install
source=('http://ftp.ktug.org/KTUG/hcr-lvt/Hamchorom-LVT.zip')
sha512sums=('0a0e8f50105eb4e1326096a5c11abf5fab5afe2d49c92d24e3a6db88234006d9c35b4bafcf2f438bf428c4368550a90876450f3e4f8bc7bbb2001282426a7537')

package() {
  cd "$srcdir/hcr-lvt/"
  mkdir -p "$pkgdir/usr/share/fonts/TTF/"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/" || return 1
}
