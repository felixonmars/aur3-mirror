# Maintainer: michelin <linuxisfun0104@gmail.com>
pkgname=cwttf-center
pkgver=1.0
pkgrel=0
pkgdesc="Set of Chinese truetype fonts from cwTeX with Chinese punctuation in the center, 5 font family included"
arch=('i686' 'x86_64')
url="http://cle.linux.org.tw/fonts/cwttf/"
license=('GPL2')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('cwttf-baseline')
install=ttf.install
source=("http://cle.linux.org.tw/fonts/cwttf/center/cwfs.ttf"
"http://cle.linux.org.tw/fonts/cwttf/center/cwheib.ttf"
"http://cle.linux.org.tw/fonts/cwttf/center/cwkai.ttf"
"http://cle.linux.org.tw/fonts/cwttf/center/cwming.ttf"
"http://cle.linux.org.tw/fonts/cwttf/center/cwyen.ttf")

build() {
  cd "$srcdir"
  install -Dm644 cwfs.ttf "$pkgdir/usr/share/fonts/cwttf/cwfs.ttf"
  install -Dm644 cwheib.ttf "$pkgdir/usr/share/fonts/cwttf/cwheib.ttf"
  install -Dm644 cwkai.ttf "$pkgdir/usr/share/fonts/cwttf/cwkai.ttf"
  install -Dm644 cwming.ttf "$pkgdir/usr/share/fonts/cwttf/cwming.ttf"
  install -Dm644 cwyen.ttf "$pkgdir/usr/share/fonts/cwttf/cwyen.ttf"
}
md5sums=('5f3594986b9b28b3142b4741263d1e00'
         'c9b80c31983466ddd7f0ec5a7f4e5e24'
         'a4b7484823c98911dbdf5851e6593def'
         '97b6ad51b9a355bb002cd436c5d8bdf6'
         '22b8c6b8ebbdff1864ac8994c42f2e6b')
