#Maintainer: bh <ang5t@gmx.net>
#Contributor: lh <jarryson#gmail.com>
#GLX Dock Forum Thread: http://www.glx-dock.org/bg_topic.php?t=7069&pos=52
pkgname=cairo-dock-plugins-bzr 
pkgver=2938 
pkgrel=1 
pkgbranch=cairo-dock-plug-ins 
pkgdesc="Plugins for Cairo-Dock" 
url="https://launchpad.net/cairo-dock" 
license=('GPL') 
arch=('i686' 'x86_64') 
depends=('cairo-dock-bzr') 
makedepends=('cmake') 
optdepends=('alsa-lib: Sound Control, Sound Effects applets [RECOMMENDED]' 
    'fftw: better analyse of the sound signal for Impulse applet' 
    'gnome-menus: Applications Menu applet [RECOMMENDED]' 
    'gtk-sharp-2: Mono API (third party applets)' 
    'gvfs: GIO-GVFS integration - open files with the right application [RECOMMENDED]' 
    'libetpan: Mail applet' 
    'libexif: EXIF support for Slider applet' 
    'libical: iCal support for Clock applet' 
    'libpulse: Impulse applet' 
    'libxklavier: Keyboard Indicator applet' 
    'zeitgeist: Recent Events applet and Recent Files menu' 
    'lm_sensors: Sensors support for System Monitor applet' 
    'ndesk-dbus-glib: Mono API (third party applets)' 
    'python: Python 3 API (third party applets) [RECOMMENDED]' 
    'python-dbus: Python 3 API (third party applets) [RECOMMENDED]' 
    'python2: Python 2 API (third party applets)' 
    'python2-dbus: Python 2 API (third party applets)' 
    'ruby: Ruby API (third party applets)' 
    'upower: UPower support for PowerManager applets [RECOMMENDED]' 
    'valac: Vala API (third party applets)' 
    'vte3: Terminal applet' 
    'webkitgtk3: Weblets applet') 
conflicts=('cairo-dock-plugins' 'cairo-dock-plugins-svn') 
provides=('cairo-dock-plugins') 
options=('!libtool') 
source=(bzr+lp:cairo-dock-plug-ins) 
md5sums=('SKIP') 

pkgver() { 
  cd "$srcdir/$pkgbranch" 
  bzr revno 
} 

build() { 
  cd $pkgbranch 

  if [[ -d build ]]; then 
    rm -rf build 
  fi 
  mkdir build && cd build 

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr 
  make 
} 

package() { 
  cd "${srcdir}"/$pkgbranch/build 

  make DESTDIR="${pkgdir}" install 
}
