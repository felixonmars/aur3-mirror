# Contributor: gucong <gucong43216@gmail.com>

pkgname=dictcn
pkgver=0.4
pkgrel=5
pkgdesc="A script to access dict.cn online dictionary with notifying and pronouncing."
arch=('any')
license=('GPL')
url="http://github.com/gucong/dictcn-script"
depends=('wget' 'xml2')
optdepends=('libnotify: for notificaton support' 'xsel: for X selection support' 'mplayer: for pronouncing support')
install=$pkgname.install
source=('dictcn' 'dictcn.el')
md5sums=('8f6a116f70b3d4afcc31f53f3da6e0f7'
         '52bd0b1220c5bf0a3eee4b155c57913a')
noextract=('dictcn' 'dictcn.el')

build() {
  install -D -m 755 "$srcdir/dictcn" "$pkgdir/usr/bin/dictcn"
  install -D -m 644 "$srcdir/dictcn.el" "$pkgdir/usr/share/emacs/site-lisp/dictcn.el"
}
