# Author: Stunts <f.pinamartins@gmail.com> 
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: tranquility

pkgname=hardware-monitor
pkgver=1.4.3
pkgrel=1
pkgdesc="The Hardware Monitor applet is a small program for the Gnome panel which tries to be a beautiful all-round solution to hardware monitoring."
arch=('i686' 'x86_64')
url="http://www.fnxweb.com/hardware-monitor-applet"
license=('GPL')
depends=('gtkmm' 'gconfmm' 'libglademm' 'libgnomecanvasmm' 'libgtop'
'gnome-panel' 'lm_sensors' 'libgnomeui' 'libsigc++') 
makedepends=('perlxml' 'gnome-common')
source=(http://www.fnxweb.com/software/hardware-monitor/$pkgname-$pkgver.tar.bz2)
md5sums=('28843253aa8a5951234e85ed960c1d9f')

build() {
  cd $startdir/src/$pkgname-$pkgver

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/hardware-monitor
  make || return 1
  make DESTDIR=$startdir/pkg install
} 
