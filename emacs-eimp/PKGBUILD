# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-eimp  
pkgver=1.4.0
pkgrel=1
pkgdesc="Emacs image manipulation program"
url="http://mph-emacs-pkgs.alioth.debian.org/EimpEl.html"
arch=('any')
license=('GPL')
depends=('emacs' 'imagemagick')
source=(https://alioth.debian.org/frs/download.php/1845/eimp-$pkgver.tar.gz)
md5sums=('31e63adca87681f77e24b4754e88bb25')
build() {
  cd $srcdir/eimp-$pkgver
  emacs -q -batch -f batch-byte-compile eimp.el
}
package() {
  install -Dm644 $srcdir/eimp-$pkgver/eimp.el $pkgdir/usr/share/emacs/site-lisp/eimp.el
  install -Dm644 $srcdir/eimp-$pkgver/eimp.elc $pkgdir/usr/share/emacs/site-lisp/eimp.elc
}
