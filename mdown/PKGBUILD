# $Id: PKGBUILD,v 1.9 2006/05/20 22:35:02 uid1016 Exp $
# Maintainer: Alexis211 <alexis211@gmail.com>

pkgname=mdown
pkgver=1.146
pkgrel=1
pkgdesc="Convert mdown-formatted plain text to various formats"
url="http://rzpages.ovh.org/projets/mdown/"
arch=(i686 x86_64)
license=('GPL')
depends=()
makedepends=('gcc')
source=(http://rzpages.ovh.org/projets/mdown/files/$pkgname-$pkgver.tgz)
md5sums=('e19ece2eb219c45ffc8a7a83575c2e15')

build() {
  cd $startdir/src/$pkgname-$pkgver
  /usr/bin/make -j1 || return 1
  mkdir $startdir/pkg/usr/bin -p
  mkdir $startdir/pkg/usr/share -p
  /usr/bin/make install PREFIX=$startdir/pkg/usr
}
