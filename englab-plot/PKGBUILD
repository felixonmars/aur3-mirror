# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=englab-plot  
pkgver=0.2.1alpha
pkgrel=2
pkgdesc="Toolbox for plotting in englab"
url="http://englab.bugfest.net/"
arch=('i686')
license=('GPL')
depends=('gcc-libs' 'mathgl')
makedepends=('libenglab')
optdepends=('englab: will be needed, or englabgui will be needed')
install=$pkgname.install
source=(http://downloads.sourceforge.net/englab/$pkgname-$pkgver.tar.gz)
md5sums=('e17759ec4e4b84d2e45792725b5377d8')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
  sed -i 's/ldconfig//g' src/makefile || return 1
  make DESTDIR=$pkgdir install || return 1
  install -d $pkgdir/usr/share/doc/englab-plot
  cp -R $pkgdir/usr/share/doc/englab/* \
    $pkgdir/usr/share/doc/englab-plot || return 1
  rm -r $pkgdir/usr/share/doc/englab || return 1
}