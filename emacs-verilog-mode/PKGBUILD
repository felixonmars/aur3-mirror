# Contributer: Jared Casper <jaredcasper@gmail.com>
pkgname=emacs-verilog-mode
_srcname=verilog-mode
pkgver=639
pkgrel=1
pkgdesc="Verilog mode for Emacs"
url="http://www.verilog.com/verilog-mode.html"
license=("GPL")
arch=('i686' 'x86_64')
source=(http://www.veripool.org/ftp/$_srcname-$pkgver.el.gz)
install=$pkgname.install
changelog=$pkgname.changelog
md5sums=('dfa7ba00733deacb5171fb25010f8417')

package() {
  install -m644 -D $srcdir/$_srcname-$pkgver.el $pkgdir/usr/share/emacs/site-lisp/$_srcname.el
}
