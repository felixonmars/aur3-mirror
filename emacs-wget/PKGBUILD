# Maintainer: Razbegaiev N.V. <marsijanin@gmail.com>

pkgname=emacs-wget
pkgver=0.5.0
pkgrel=1
pkgdesc="Interface program for GNU wget on Emacs"
arch=('i686' 'x86_64')
url="http://pop-club.hp.infoseek.co.jp/emacs/emacs-wget/"
license=('GPL')
depends=(emacs wget)
optdepends=('emacs-w3m or emacs-w3m-cvs : use wget with w3m in emacs')
source=(http://pop-club.hp.infoseek.co.jp/emacs/emacs-wget/$pkgname-$pkgver.tar.gz)
md5sums=('eed64c8bd629b82538753af54e8749ab')

build() {
  cd $startdir/src/emacs-wget-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
  cp $startdir/src/emacs-wget-$pkgver/USAGE $startdir/pkg/usr/share/emacs/site-lisp/emacs-wget/
}
