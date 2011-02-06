# Contributor: Alexander Tsamutali <astsmtl@yandex.ru>

pkgname=emacs-mingus
pkgver=0.28
pkgrel=1
pkgdesc="A frontend for GNUEmacs to the Music Player daemon."
arch=('any')
url="http://niels.kicks-ass.org/index.php/emacs/mingus/"
license=('GPL')
depends=('emacs' 'emacs-libmpdee')
install=emacs-mingus.install
source=("http://niels.kicks-ass.org/public/mingus/src/mingus-$pkgver.el")
md5sums=('b7ba99fbf02cbcdea6898e9af7514791')

build() {
  cd "$srcdir/"

  #emacs --batch -f batch-byte-compile *.el || return 1

  install -d "$pkgdir/usr/share/emacs/site-lisp/" || return 1
  install -m 644 mingus-$pkgver.el "$pkgdir/usr/share/emacs/site-lisp/mingus.el" || return 1
  #install -m 644 mingus-$pkgver.elc "$pkgdir/usr/share/emacs/site-lisp/mingus.elc" || return 1
}
