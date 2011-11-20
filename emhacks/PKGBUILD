# Contributor: Junmin Huang <junmin(dot)h(at)gmail(dot)com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emhacks
pkgver=20070920
pkgrel=4
pkgdesc="Useful Emacs Lisp libraries, including gdiff, jjar, jmaker, swbuff and tabbar, packaged from gentoo portage"
arch=('any')
url="http://emhacks.sourceforge.net/"
license=('GPL2')
depends=(emacs)
install=emhacks.install
source=(http://www.mirrorservice.org/sites/www.ibiblio.org/gentoo/distfiles/$pkgname-$pkgver.tar.bz2)
md5sums=('d349c78d25ce91a6f9c3e6446b129fc8')

build() {
  cd $srcdir/$pkgname-$pkgver

  # remove files included in Emacs>=22 or not useful on GNU/Linux
  rm -r findstr* overlay-fix* recentf* ruler-mode* tree-widget*
  for _i in gdiff-setup jjar jmaker swbuff tabbar
  do
    [ -f ${_i}.el.gz ] && rm ${_i}.el.gz
    emacs -batch -q -f batch-byte-compile ${_i}.el
    gzip ${_i}.el
  done
}
package() {
  install -d $pkgdir/usr/share/emacs/site-lisp/$pkgname
  install -Dm644 $srcdir/$pkgname-$pkgver/* \
    $pkgdir/usr/share/emacs/site-lisp/$pkgname
}
