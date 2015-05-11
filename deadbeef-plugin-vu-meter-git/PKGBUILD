pkgname=deadbeef-plugin-vu-meter-git
pkgver=20150510
pkgrel=1
pkgdesc="Retro VU Meter Plugin for the DeaDBeeF audio player (development version)"
url="https://github.com/cboxdoerfer/ddb_vu_meter"
arch=('i686' 'x86_64')
license='GPL2'
depends=('deadbeef' 'gtk2')
makedepends=('git' 'pkg-config')

source=(https://raw.githubusercontent.com/eimiss/arch_vu_meter_patch/master/arch_vu_meter_patch)
sha256sums=('SKIP')

_gitname=ddb_vu_meter
_gitroot=https://github.com/cboxdoerfer/${_gitname}

build() {
  cd $srcdir
  msg "Connecting to GIT server..."
  rm -rf $srcdir/$_gitname-build

  if [ -d $_gitname ]; then
    cd $_gitname
    git pull origin master
  else
    git clone $_gitroot
    cd $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd $srcdir
  cp -r $_gitname $_gitname-build

  cd $_gitname-build

  touch AUTHORS
  touch ChangeLog

  patch -p1 vumeter.c < $srcdir/arch_vu_meter_patch

  make -j`nproc`
}

package() {
  install -D -v -c $srcdir/$_gitname-build/gtk2/ddb_vis_vu_meter_GTK2.so $pkgdir/usr/lib/deadbeef/ddb_vis_vu_meter_GTK2.so
  install -D -v -c $srcdir/$_gitname-build/gtk3/ddb_vis_vu_meter_GTK3.so $pkgdir/usr/lib/deadbeef/ddb_vis_vu_meter_GTK3.so
  install -D -v -c $srcdir/$_gitname-build/vumeter.png $pkgdir/usr/lib/deadbeef/vumeter.png
}

