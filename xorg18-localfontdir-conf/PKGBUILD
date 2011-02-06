# Maintainer: Erus <erus.iluvatar@gmail.com>

pkgname=xorg18-localfontdir-conf
pkgver=1
pkgrel=1
pkgdesc="A quick package to have /usr/share/fonts/local used as a fontdir bu X 1.8"
url='http://perdu.com/'
arch=('any')
license=(custom:WTFPL)
source=(30-fonts.conf)
md5sums=('bce81983dde0c660b2e383e8b5863f19')

build() {
  install -Dm644 30-fonts.conf $pkgdir/etc/X11/xorg.conf.d/30-fonts.conf
}
