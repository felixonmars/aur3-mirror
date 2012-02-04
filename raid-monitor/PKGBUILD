# Contributor: Teo Mrnjavac <teo.mrnjavac@gmail.com>

pkgname=raid-monitor
pkgver=0.26.3
pkgrel=1
pkgdesc="Qt4 app for monitoring Linux RAID arrays."
arch=('i686' 'x86_64')
url="http://raid-monitor.mihosoft.eu/"
license=('GPL')
depends=('qt' 'mdadm')
makedepends=('cmake')
source=(http://raid-monitor.mihosoft.eu/download/raid-monitor-0.26-3.tar.bz2)
md5sums=('')

build() {
   cd $startdir/src/raid-monitor-0.26-3
   cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
   make VERBOSE=1 || return 1
   make DESTDIR=$startdir/pkg install || return 1
}
                        
                        
                        
                        
