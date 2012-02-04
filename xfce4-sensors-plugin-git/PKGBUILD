# Maintainer kfgz <kfgz at interia pl>
# Package based on xfce4-sensors-plugin

pkgname=xfce4-sensors-plugin-git
pkgver=20110602
pkgrel=1
pkgdesc="A lm_sensors plugin for the Xfce panel"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://git.xfce.org/panel-plugins/xfce4-sensors-plugin/"
groups=('xfce4-goodies')
depends=('xfce4-panel>=4.6.0' 'gnu-netcat' 'hddtemp>=0.3.beta15.45-2' 'lm_sensors>=3.1.0' 'libnotify>0.7.1' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'intltool' 'xfce4-dev-tools' 'git')
options=(!libtool)
conflicts=('xfce4-sensors-plugin' 'xfce4-sensors-plugin-svn')
install=xfce4-sensors-plugin.install

_gitroot="git://git.xfce.org/panel-plugins/xfce4-sensors-plugin"
_gitname="xfce4-sensors-plugin"

build() {
  cd ${srcdir}
  msg "Connecting to xfce.org GIT server...."

  if [ -d ${srcdir}/${_gitname} ] ; then
   cd ${_gitname} && git pull origin
   msg "The local files are updated."
  else
   git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Creating build directory"
  
  if [ -d ${srcdir}/${_gitname}-build ]; then rm -rf ${srcdir}/${_gitname}-build; fi
  cp -R ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build

  msg "Starting make..."
  cd ${srcdir}/${_gitname}-build
  
  ./autogen.sh --prefix=/usr \
	--sysconfdir=/etc \
	--libexecdir=/usr/lib \
	--localstatedir=/var \
	--disable-static \
	--with-pathhddtemp=/usr/sbin/hddtemp \
	--disable-debug
	
  make -j1
}

package() {
  cd ${srcdir}/${_gitname}-build
  make DESTDIR=${pkgdir} install
}
