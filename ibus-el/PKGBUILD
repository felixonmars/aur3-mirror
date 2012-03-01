# Maintainer: favadi <imeo@favadi.com>
# Maintainer: XeCycle <XeCycle@Gmail.com>

pkgname=ibus-el
pkgver=0.3.2
pkgrel=1
# epoch=
pkgdesc="IBus client for GNU Emacs"
arch=('any')
url="https://launchpad.net/ibus.el"
license=('GPL')
# groups=()
depends=('emacs' 'python-xlib' 'ibus' 'python2')
# makedepends=()
# checkdepends=()
optdepends=('ibus-unikey' 'ibus-m17n' 'ibus-qt')
# provides=()
# conflicts=()
# replaces=()
# backup=()
# options=()
install=$pkgname.install
changelog=
source=(https://launchpad.net/ibus.el/0.3/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('3b0e8f964889c36d9f3f06dd732549b9')
noextract=()

build() {
  cd "$srcdir/$pkgname-$pkgver"
  emacs --batch -f batch-byte-compile ibus.el
}

# check() {
#   cd "$srcdir/$pkgname-$pkgver"
#   make -k check
# }

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -m 755 -d "$pkgdir/usr/share/emacs/site-lisp/ibus"
  install -m 644 README ibus.{el,elc} "$pkgdir/usr/share/emacs/site-lisp/ibus"
  install -m 755 ibus-el-agent "$pkgdir/usr/share/emacs/site-lisp/ibus"
}
