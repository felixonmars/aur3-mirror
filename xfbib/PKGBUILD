# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Marc St-Laurent <mstlaurent@canada.com>

pkgname=xfbib
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight BibTeX editor developed for the Xfce desktop manager"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/applications/xfbib/"
license=('GPL')
depends=('desktop-file-utils' 'libxfce4ui')
makedepends=('xfce4-dev-tools')
install=$pkgname.install
source=(http://git.xfce.org/apps/$pkgname/snapshot/$pkgname-$pkgver.tar.bz2)
sha256sums=('31d28a92d03450cba504feaaf010d6eb5ad62114bb9a76621dc772934b88d41a')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
