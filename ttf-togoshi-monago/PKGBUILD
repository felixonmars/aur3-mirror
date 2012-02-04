# Contributor: muflax <muflax@gmail.com>

pkgname=ttf-togoshi-monago
pkgver=20080629
pkgrel=1
pkgdesc="Japanese Togoshi font, based on Kochi Substitute - Monago"
arch=('any')
license=('custom')
url="http://togoshi-font.sourceforge.jp/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("http://osdn.dl.sourceforge.jp/togoshi-font/31795/togoshi-monago-${pkgver}.tar.gz"
        "license.txt")
md5sums=('7f243d857b72cc4b5d33faab5b1b4016'
         '67b994aa1f9c1df99854757c103820aa')
                                
build() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/fonts/TTF
  install -m644 togoshi-monago-$pkgver/togoshi-monago.ttf $pkgdir/usr/share/fonts/TTF/ || return 1
  mkdir -p $pkgdir/usr/share/licenses/custom/${pkgname}
  install -m644 license.txt $pkgdir/usr/share/licenses/custom/${pkgname}/license.txt || return 1
}
