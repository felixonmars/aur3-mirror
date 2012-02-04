# Maintainer: Stefan Husmann <stefan-husmann@t-online.de><
pkgname=mmm-mode  
pkgver=0.4.8
pkgrel=4
pkgdesc="minor mode for Emacs that allows Multiple Major Modes to \
coexist in one buffer"
url="http://mmm-mode.sourceforge.net/"
arch=('any')
license=('GPL')
install=mmm-mode.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('5dd9e415ced923b588962efa41324de4')
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  install -d $pkgdir/usr/share/info || return 1
  mv $pkgdir/usr/info $pkgdir/usr/share || return 1
  cd $pkgdir/usr/share/info
  gzip -9 mmm.info* || return 1
  [ ! -f dir ] || rm dir || return 1
  install -d $pkgdir/usr/share/emacs/site-lisp/mmm-mode || return 1
  mv $pkgdir/usr/share/emacs/site-lisp/*.el* \
    $pkgdir/usr/share/emacs/site-lisp/mmm-mode || return 1
}