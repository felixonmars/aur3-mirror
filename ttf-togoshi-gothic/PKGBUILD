# Contributor: muflax <muflax@gmail.com>

pkgname=ttf-togoshi-gothic
pkgver=20080629
pkgrel=1
pkgdesc="Japanese Togoshi font, based on Kochi Substitute - Gothic"
arch=('any')
license=('custom')
url="http://togoshi-font.sourceforge.jp/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("http://osdn.dl.sourceforge.jp/togoshi-font/31792/togoshi-gothic-${pkgver}.tar.gz"
        "license.txt")
md5sums=('087eaa5c8afa338151f5f38f4c6f93d7'
         '67b994aa1f9c1df99854757c103820aa')
                                
build() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/fonts/TTF
  install -m644 togoshi-gothic-$pkgver/togoshi-gothic.ttf $pkgdir/usr/share/fonts/TTF/ || return 1
  mkdir -p $pkgdir/usr/share/licenses/custom/${pkgname}
  install -m644 license.txt $pkgdir/usr/share/licenses/custom/${pkgname}/license.txt || return 1
}
