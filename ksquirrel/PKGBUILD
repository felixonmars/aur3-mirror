# Contributor: Ronald van Haren <ronald.archlinux.org>
 
 pkgname=ksquirrel
 pkgver=0.8.0
 pkgrel=3
 pkgdesc="KSquirrel is an image viewer for KDE implementing OpenGL."
 url="http://ksquirrel.sourceforge.net/"
 license=('GPL2' 'LGPL2' 'custom:gfdl')
 depends=('ksquirrel-libs' 'kdebase3' 'kdelibs3' 'libkexif')
 source=(http://downloads.sourceforge.net/ksquirrel/$pkgname-$pkgver.tar.bz2 'ksquirrel-0.8.0-gcc43.patch')
 arch=('i686' 'x86_64')
 md5sums=('efdc0943dd19470c5ecc15dc77e9fb4a' 'be89632c0fe410856ae3ee1a38cd28df')
 
 build() {
 . /etc/profile.d/qt3.sh
 . /etc/profile.d/kde3.sh
 cd ${srcdir}/${pkgname}-${pkgver}
 
 # gcc43 build patch
 patch -p1 -i $srcdir/ksquirrel-0.8.0-gcc43.patch

 ./configure --prefix=/opt/kde
 make || return 1
 make DESTDIR=${pkgdir} install || return 1
 
 # install custom license
 install -Dm644 COPYING ${pkgdir}/usr/share/licenses/ksquirrel/COPYING
 install -Dm644 LICENSE.GFDL ${pkgdir}/usr/share/licenses/ksquirrel/license.gfdl
  }
