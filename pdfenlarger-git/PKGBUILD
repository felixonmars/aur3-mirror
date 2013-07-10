# Maintainer: Max Rosin <archlinux at maxrosin dot com>
pkgname=pdfenlarger-git
pkgver=20130710
pkgrel=1
pkgdesc="Add additional white space to a PDF-file."
arch=('any')
url="https://github.com/ekeih/pdfenlarger"
license=('WTFPL')
depends=('texlive-bin')
makedepends=('git')

_gitbase="git://github.com/ekeih/pdfenlarger.git"

build() {
  git clone $_gitbase $pkgname-$pkgver
}

package() {
  install -D "$srcdir/$pkgname-$pkgver/pdfenlarger.sh" "$pkgdir/usr/bin/pdfenlarger"
}
