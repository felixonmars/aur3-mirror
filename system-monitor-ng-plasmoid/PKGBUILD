# Maintainer: Christian Holme <cholme at gmx dot com>
# Contributor: Fedor Suchkov <f.suchkov@gmail.com>
pkgname=system-monitor-ng-plasmoid
pkgver=1.0
pkgrel=2
pkgdesc="A plasmoid to show your CPU and memory usage. It is a fork of the default KDE system monitor"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/show.php?content=94746"
license=('GPL2+')
depends=('kdebase-workspace>=4.2')
makedepends=('automoc4')
source=("http://www.kde-look.org/CONTENT/content-files/94746-system_status_ng.tgz" "kde4.2.patch")
md5sums=('421aa8196091837dcc8c5ee801c7cf38' '7539d7e1ff55623ca7504ab86cb43895')
build() {
  cd $srcdir
  patch -Np1 -i ${srcdir}/kde4.2.patch
  mv ${srcdir}/system_status_ng/applet/plasma-applet-system_monitor.desktop ${srcdir}/system_status_ng/applet/plasma-applet-system_monitor_ng.desktop
  cd system_status_ng
  if [ -d build ]; then
    echo Removing files of previous build
    rm -r build; 
  fi
  mkdir build && cd build;
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
