# Contributor: muflax <muflax@gmail.com>

pkgname=ttf-togoshi-mono
pkgver=20080629
pkgrel=1
pkgdesc="Japanese Togoshi font, based on Kochi Substitute - Mono"
arch=('any')
license=('custom')
url="http://togoshi-font.sourceforge.jp/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("http://osdn.dl.sourceforge.jp/togoshi-font/31796/togoshi-mono-${pkgver}.tar.gz"
        "license.txt")
md5sums=('953854d45726c9b0a971456474270db7'
         '67b994aa1f9c1df99854757c103820aa')
                                
build() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/fonts/TTF
  install -m644 togoshi-mono-$pkgver/togoshi-mono.ttf $pkgdir/usr/share/fonts/TTF/ || return 1
  mkdir -p $pkgdir/usr/share/licenses/custom/${pkgname}
  install -m644 license.txt $pkgdir/usr/share/licenses/custom/${pkgname}/license.txt || return 1
}
