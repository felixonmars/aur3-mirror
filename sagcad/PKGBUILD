# Maintainer: Julien Pecqueur <jpec at julienpecqueur dot com>

pkgname=sagcad
pkgver=0.9.14
pkgrel=0
pkgdesc="SagCAD, a CAD/CAM of 2D"
arch=('i686' 'x86_64')
url="http://sagcad.sourceforge.jp/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=('sagcad')
backup=()
options=()
install=
source=(http://jaist.dl.sourceforge.jp/sagcad/39376/sagcad-0.9.14.tar.gz)
noextract=()
md5sums=('504c209d555e75823773bfc66af9347c')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}