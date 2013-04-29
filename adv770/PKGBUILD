# Maintainer: loafer <davemorgan353 at btinternet dot com>

pkgname=adv770
pkgver=2.07
pkgrel=1
pkgdesc="770 points version of Adventure"
arch=('i686' 'x86_64')
url="http://www.mipmip.org/adv770"
license=('unknown')
source=(http://www.mipmip.org/$pkgname/$pkgname.tgz)

build() {
  msg2 "Nothing to build..."
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m755 adv770 "$pkgdir"/usr/bin/"$pkgname"
  install -D -m644 README.txt "$pkgdir"/usr/share/doc/"$pkgname"/README.txt
  install -D -m644 Adv770.desktop "$pkgdir"/usr/share/applications/Adv770.desktop
  install -D -m644 adv770.png "$pkgdir"/usr/share/icons/HighContrast/128x128/apps/adv770.png
}
md5sums=('34231d1133f66ae065844c8a19912051')
