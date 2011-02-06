# Contributor: gucong <gucong43216@gmail.com>

pkgname=dictcn
pkgver=0.4
pkgrel=2
pkgdesc="A script to access dict.cn online dictionary with notifying and pronouncing."
arch=('any')
license=('GPL')
url="http://github.com/gucong/dictcn-script"
depends=('bash' 'wget' 'sed' 'coreutils' 'xml2')
optdepends=('libnotify: for notificaton support' 'xsel: for X selection support' 'mplayer: for pronouncing support')
source=('dictcn')
noextract=('dictcn')
md5sums=('aafd44aaa374661107263b9196430afb')

build() {
  install -D -m 755 "$srcdir/dictcn" "$pkgdir/usr/bin/dictcn"
}
