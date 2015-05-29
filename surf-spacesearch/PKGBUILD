# Maintainer: sekret
_pkgname=surf
pkgname=$_pkgname-spacesearch
pkgver=0.6
pkgrel=1
pkgdesc="a WebKit based browser"
arch=('i686' 'x86_64')
url="http://surf.suckless.org/"
license=('custom:MIT/X')
depends=('webkitgtk2' 'xorg-xprop' 'dmenu')
makedepends=('git')
optdepends=('ca-certificates: SSL verification'
'st: default terminal for the download handler'
'curl: default download handler')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('http://dl.suckless.org/surf/surf-0.6.tar.gz'
        'surf-0.6-spacesearch.diff'
        'config.h')
md5sums=('aeeed723b562a30cc6a2b3ea18f6d99a'
         'SKIP'
         'SKIP')

prepare() {
  cd "$_pkgname-0.6"
  cp "$srcdir/config.h" .
  patch -p1 < "$srcdir/surf-0.6-spacesearch.diff"
}

build() {
  cd "$_pkgname-0.6"
  make PREFIX=/usr DESTDIR="$pkgdir"
}

package() {
  cd "$_pkgname-0.6"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
