# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=englab-cimg  
pkgver=0.2.3
pkgrel=5
pkgdesc="Englab-toolbox for the C++ Template Image Processing Toolkit"
url="http://englab.bugfest.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc-libs' 'libx11')
makedepends=('libenglab' 'cimg')
optdepends=('englab: will bee needed, or englabgui will be needed')
install=$pkgname.install
source=(http://downloads.sourceforge.net/englab/$pkgname-$pkgver.tar.gz \
  englab-cimg.conf)
md5sums=('130b7fcc82fcd3d058f18d61f3a9c285' '3aadc4d7c63bbd14f5139d99a00812e1')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
  sed -i 's/ldconfig//g' src/makefile || return 1
  make DESTDIR=$pkgdir install  || return 1
  install -Dm644 ../englab-cimg.conf \
    $pkgdir/etc/englab/toolboxes/englab-cimg.conf || return 1 
  rm $pkgdir/etc/englab/$pkgname.conf || return 1
}