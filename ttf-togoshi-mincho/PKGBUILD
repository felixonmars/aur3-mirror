# Contributor: muflax <muflax@gmail.com>

pkgname=ttf-togoshi-mincho
pkgver=20080511
pkgrel=1
pkgdesc="Japanese Togoshi font, based on Kochi Substitute - Mincho"
arch=('any')
license=('custom')
url="http://togoshi-font.sourceforge.jp/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("http://osdn.dl.sourceforge.jp/togoshi-font/30983/togoshi-mincho-${pkgver}.tar.gz"
        "license.txt")
md5sums=('30565ed592e6f940a242bee7be5a0299'
         '67b994aa1f9c1df99854757c103820aa')
                                
build() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/fonts/TTF
  install -m644 togoshi-mincho-$pkgver/togoshi-mincho.ttf $pkgdir/usr/share/fonts/TTF/ || return 1
  mkdir -p $pkgdir/usr/share/licenses/custom/${pkgname}
  install -m644 license.txt $pkgdir/usr/share/licenses/custom/${pkgname}/license.txt || return 1
}
