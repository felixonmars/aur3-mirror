# Contributor: gucong <gucong43216@gmail.com>

pkgname=dictcn
pkgver=0.4
pkgrel=3
pkgdesc="A script to access dict.cn online dictionary with notifying and pronouncing."
arch=('any')
license=('GPL')
url="http://github.com/gucong/dictcn-script"
depends=('bash' 'wget' 'sed' 'coreutils' 'xml2')
optdepends=('libnotify: for notificaton support' 'xsel: for X selection support' 'mplayer: for pronouncing support')
source=('dictcn')
md5sums=('d31f4d8c318b0309a257964034458571')
noextract=('dictcn')

build() {
  install -D -m 755 "$srcdir/dictcn" "$pkgdir/usr/bin/dictcn"
}
