#Maintainer: bh <ang5t@gmx.net>
#Contributor: lh <jarryson#gmail.com>
#GLX Dock Forum Thread: http://www.glx-dock.org/bg_topic.php?t=7069&pos=52
pkgname=cairo-dock-bzr 
pkgver=1622 
pkgrel=1 
pkgbranch=cairo-dock-core 
pkgdesc="Light eye-candy fully themable animated dock" 
arch=('i686' 'x86_64') 
url="http://www.glx-dock.org/index.php" 
license=('GPL') 
depends=('curl' 'dbus-glib' 'gtk3' 'librsvg') 
makedepends=('cmake') 
optdepends=('cairo-dock-plugins: Plugins for Cairo-Dock', 'gnome-session: Cairo-Dock session') 
options=('!libtool') 
conflicts=('cairo-dock' 'cairo-dock-svn') 
provides=('cairo-dock') 
source=(bzr+lp:cairo-dock-core) 
md5sums=('SKIP') 

pkgver() { 
 cd "$srcdir/$pkgbranch" 
 bzr revno 
} 

build() { 
  cd "${srcdir}"/$pkgbranch 

  if [[ -d build ]]; then 
    rm -rf build 
  fi 
  mkdir build && cd build 

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -Denable-desktop-manager=ON 
  make 
} 

package() { 

  cd "${srcdir}"/$pkgbranch/build 
  make DESTDIR="${pkgdir}" install 
}
