# Maintainer: TDY <tdy@archlinux.info>

pkgname=faqtor
pkgver=0.8
pkgrel=1
pkgdesc="FAQ generaTOR"
arch=('any')
url="http://faqtor.sourceforge.net/"
license=('GPL')
depends=('python2>=2.3')
install=faqtor.install
source=(http://downloads.sourceforge.net/faqtor/faqtor-$pkgver.tgz)
md5sums=('c3901c2b0f630963c324c9ebd591a834')

package() {
  cd "$srcdir"
  sed -i '1c\#!/usr/bin/env python2' faqtor.py
  sed -i '5s|\.py||' README
  install -Dm755 faqtor.py "$pkgdir/usr/bin/faqtor"
  install -Dm644 README "$pkgdir/usr/share/doc/faqtor/README"
  install -m644 *.cfg *.xml "$pkgdir/usr/share/doc/faqtor"
}

# vim:set ts=2 sw=2 et:
