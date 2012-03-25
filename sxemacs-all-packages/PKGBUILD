# $Id: PKGBUILD 55248 2011-09-07 10:47:52Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=sxemacs-all-packages
pkgver=20110907
pkgrel=1
pkgdesc="xemacs-all-packages bundle from xemacs.org"
arch=(any)
url="http://xemacs.org/"
license=(GPL)
depends=('sxemacs')
conflicts=('xemacs-sumo' 'xemacs-base')
options=('!strip')
source=(http://ftp.xemacs.org/pub/packages/xemacs-all-packages.tar.bz2)
md5sums=('951ff1fb348e17bda74844788068e792')

build() {
  install -d $pkgdir/usr/share/sxemacs/sxemacs-packages/
  cp -r $srcdir/xemacs-packages/* $pkgdir/usr/share/sxemacs/sxemacs-packages/

  echo "(setq load-path (append '(" >>$pkgdir/usr/share/sxemacs/sxemacs-packages/lisp/site-start.el
  ls -1 $pkgdir/usr/share/sxemacs/sxemacs-packages/lisp/ | while read a; do
    [ -d "$pkgdir/usr/share/sxemacs/sxemacs-packages/lisp/" ] && \
      echo '"/usr/share/sxemacs/sxemacs-packages/lisp/'$a'"' >>$pkgdir/usr/share/sxemacs/sxemacs-packages/lisp/site-start.el
  done
  echo " ) load-path))" >>$pkgdir/usr/share/sxemacs/sxemacs-packages/lisp/site-start.el

  find  $pkgdir/usr/share/sxemacs/sxemacs-packages/lisp -name *.el -exec sxemacs -batch -no-site-file -no-init-file -f batch-byte-compile {} \;
}
