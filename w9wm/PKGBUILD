# Maintainer: OS Hazard <oshazard+aur@gmail.com>
# Contributor: Callan Barrett <wizzomafizzo@gmail.com>

pkgname=w9wm
pkgver=0.4.2
pkgrel=3
pkgdesc="Improved version of 9wm with support for virtual desktops and keybindings"
arch=('i686' 'x86_64')
url="http://www.grassouille.org/code/w9wm.en.html"
license=('custom')
depends=('libxext' 'libxau' 'libxdmcp' 'xterm')
makedepends=('imake')
source=(http://www.grassouille.org/code/w9wm/src/$pkgname-$pkgver.tar.gz)
md5sums=('4c4bf243d9ae1478878c2b3bfcda144f')

build() {
  cd $srcdir/$pkgname-$pkgver.orig
  xmkmf
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver.orig
  mkdir -p $pkgdir/usr/bin
  make DESTDIR="${pkgdir}" install install.man
  chmod +x $pkgdir/usr/bin/w9wm
  install -Dm644 README.9wm ${pkgdir}/usr/share/licenses/w9wm/README.9wm
}
