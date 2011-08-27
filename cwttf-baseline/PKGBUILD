# Maintainer: michelin <linuxisfun0104@gmail.com>
pkgname=cwttf-baseline
pkgver=1.0
pkgrel=0
pkgdesc="Set of Chinese truetype fonts from cwTeX with Chinese punctuation at the baseline, 5 font family included"
arch=('i686' 'x86_64')
url="http://cle.linux.org.tw/fonts/cwttf/"
license=('GPL2')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('cwttf-center')
install=ttf.install
source=("http://cle.linux.org.tw/fonts/cwttf/baseline/cwfs.ttf"
"http://cle.linux.org.tw/fonts/cwttf/baseline/cwheib.ttf"
"http://cle.linux.org.tw/fonts/cwttf/baseline/cwkai.ttf"
"http://cle.linux.org.tw/fonts/cwttf/baseline/cwming.ttf"
"http://cle.linux.org.tw/fonts/cwttf/baseline/cwyen.ttf")

build() {
  cd "$srcdir"
  install -Dm644 cwfs.ttf "$pkgdir/usr/share/fonts/cwttf/cwfs.ttf"
  install -Dm644 cwheib.ttf "$pkgdir/usr/share/fonts/cwttf/cwheib.ttf"
  install -Dm644 cwkai.ttf "$pkgdir/usr/share/fonts/cwttf/cwkai.ttf"
  install -Dm644 cwming.ttf "$pkgdir/usr/share/fonts/cwttf/cwming.ttf"
  install -Dm644 cwyen.ttf "$pkgdir/usr/share/fonts/cwttf/cwyen.ttf"
}
md5sums=('e7e034315e8a82341f3bbd46ae2c19b0'
         '5a8a7800253ab1ec3c0717aa5531df31'
         'ced6955007b0f78db9303d407dfa9bc4'
         '9d2ee4badf2873e850eafebbade01f65'
         '478d154df7e5971432fc25a0458b286d')
