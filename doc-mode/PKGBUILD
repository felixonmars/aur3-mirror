# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Peter Simons <simons@cryp.to>

pkgname=doc-mode
pkgver=1.1
pkgrel=3
pkgdesc="Asciidoc mode for Emacs"
arch=('any')
license=('GPL')
url="http://xpt.sourceforge.net/tools/doc-mode/"
source=("http://downloads.sourceforge.net/xpt/$pkgname-$pkgver.tgz")
md5sums=('202408ca62e0bc5d3e12d4053cc45352')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 doc-mode.el "$pkgdir/usr/share/emacs/site-lisp/doc-mode.el"
  install -Dm644 doc-mode.htm "$pkgdir/usr/share/doc/$pkgname/doc-mode.htm"
  install -m644 *png "$pkgdir/usr/share/doc/$pkgname/"
}
