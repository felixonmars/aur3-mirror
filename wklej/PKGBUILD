# Maintainer: Bartek Piotrowski <barthalion@gmail.com>

pkgname=wklej
pkgver=0.2.0
pkgrel=1
pkgdesc="command-line interface to wklej.org"
url="http://wklej.org/"
license=(GPL)
arch=('i686' 'x86_64')
depends=('python')
source=(http://wklej.org/m/apps/${pkgname}-${pkgver}.tar.gz)
md5sums=('29dd23756e6d68f722b132f92a328a0a')

build() {
  install -D -m 775 wklej $pkgdir/usr/bin/wklej
  install -D -m 644 README $pkgdir/usr/share/doc/wklej/README
  install -D -m 644 wklej.vim $pkgdir/usr/share/vim/plugin/wklej.vim
}
