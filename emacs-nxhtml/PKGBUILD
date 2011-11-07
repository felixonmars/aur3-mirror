# Contributor: Ismael Barros (RazZziel) <razielmine@gmail.com>
# Thanks to http://gpo.zugaina.org/app-emacs/nxhtml-mode
pkgname=emacs-nxhtml
pkgver=2.08
_pkgdate=100425
pkgrel=2
pkgdesc="Emacs Utilities for Web Development"
arch=('any')
url="http://ourcomments.org/Emacs/nXhtml/doc/nxhtml.html"
license=('GPL')
depends=('emacs')
install=$pkgname.install
source=(http://ourcomments.org/Emacs/DL/elisp/nxhtml/zip/nxhtml-$pkgver-$_pkgdate.zip)
md5sums=('26bfe125c38801246aeb64df00541efa')

build() {
  cd $srcdir/nxhtml/

  find . -type f \
    -exec chmod -x {} + \
    -exec sed -i -e 's:\r$::' {} +

  # Regenerate the autoload code.
  emacs --batch -L $srcdir/nxhtml -L $srcdir/nxhtml/util -l nxhtmlmaint.el -f nxhtmlmaint-get-all-autoloads 
  emacs --batch --no-site-file \
      -L $srcdir/nxhtml/ \
      -L $srcdir/nxhtml/nxhtml/ \
      -L $srcdir/nxhtml/util/ \
      -L $srcdir/nxhtml/related/ \
      -f batch-byte-compile \
      autostart.el nxhtml-loaddefs.el nxhtml/*.el util/*.el related/*.el

  install -d $pkgdir/usr/share/emacs/site-lisp/
  cp -a $srcdir/nxhtml/ $pkgdir/usr/share/emacs/site-lisp

  #chmod a+w $pkgdir/usr/share/emacs/site-lisp/nxhtml/etc/schema/xhtml-loader.rnc
  echo 'include "../../../../23.1/etc/schema/xhtml.rnc"' > $pkgdir/usr/share/emacs/site-lisp/nxhtml/etc/schema/xhtml-loader.rnc
}

