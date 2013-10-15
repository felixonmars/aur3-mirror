# Contributor: Radu Andries  <admiral0 at tuxfamily.org>

pkgname=kdeplasma-applets-switchy
pkgver=1.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A plasmoid for kde4 using vga_switcheroo. Only switchable graphics"
url="https://github.com/admiral0/Switchy"
makedepends=("cmake" "automoc4")
depends=('kdebase-workspace')
replaces=('kdeplasma-applet-switchy')
conflicts=('kdeplasma-applet-switchy')
license=('GPL')
source=("http://kde-look.org/CONTENT/content-files/136969-Switchy-1.0.tar.bz2" 
	"vgad"
	"org.admiral0.vgad.conf")

build() {
  cd  $srcdir/Switchy/
  if [ -d build ]; then
    rm -rf build
  fi
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $srcdir/Switchy/build
  make DESTDIR=$pkgdir install
  install -D daemon/vgad $pkgdir/usr/bin/vgad
  install -D client/vgac $pkgdir/usr/bin/vgac
  install -D $srcdir/vgad $pkgdir/etc/rc.d/vgad
  install -D $srcdir/org.admiral0.vgad.conf $pkgdir/etc/dbus-1/system.d/org.admiral0.vgad.conf

}
md5sums=('6938214b0b56c479d4872c31f4d071eb'
         'd9cc95fcc86aedb4541dabc8c6ecb603'
         '7d78ee23540fe0b876cf687e0d569312')
