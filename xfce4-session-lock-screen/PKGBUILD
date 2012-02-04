# Maintainer: Nikita Nikishin <nnikishi@emich.edu>

pkgname=xfce4-session-lock-screen
pkgver=4.8.2
pkgrel=2
pkgdesc="A session manager for Xfce (with screen locking and user switching)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.xfce.org/"
depends=('xfce4-panel' 'gconf' 'libgnome-keyring' 'libwnck' 'libsm' 'xorg-iceauth' 'upower' 'consolekit' 'hicolor-icon-theme' )
makedepends=('intltool')
optdepends=('fortune-mod: for xfce4-tips')
replaces=('xfce4-toys')
backup=(etc/polkit-1/localauthority/50-local.d/org.freedesktop.consolekit.pkla
	etc/polkit-1/localauthority/50-local.d/org.freedesktop.upower.pkla)
conflicts=('xfce4-session' 'xfce4-session-git' 'xfce4-session-devel')
provides=('xfce4-session')
options=('!libtool')
install=xfce4-session.install
source=(http://archive.xfce.org/src/xfce/xfce4-session/4.8/xfce4-session-${pkgver}.tar.bz2
	org.freedesktop.consolekit.pkla
	org.freedesktop.upower.pkla
	lockscreen.patch)
md5sums=('48780cbcf784ab64debc9312f17765f2'
         '2e2519950d8c591dc9440ed8957a49ed'
         '5fa270637b5e685f033863d8664795a2'
	 'dc0a3da3bab83da0c7a7430a5907ba14')

build() {
  cd ${srcdir}
  
  patch -p0 -i ../lockscreen.patch
  cd xfce4-session-${pkgver}
  
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--libexecdir=/usr/lib/xfce4 \
	--localstatedir=/var \
	--disable-static \
	--disable-hal \
	--enable-gnome \
	--enable-libgnome-keyring \
	--enable-session-screenshots \
	--enable-upower \
	--enable-consolekit \
	--enable-polkit \
	--enable-panel-plugin \
	--disable-debug
  make
}

package() {
  cd ${srcdir}/xfce4-session-${pkgver}
  make DESTDIR=${pkgdir} install
  
  # install polkit/consolekit permission file needed for usage without a display manager
  install -dm700 ${pkgdir}/etc/polkit-1/localauthority
  install -dm755 ${pkgdir}/etc/polkit-1/localauthority/50-local.d
  install -m644 ${srcdir}/org.freedesktop.consolekit.pkla ${pkgdir}/etc/polkit-1/localauthority/50-local.d/
  install -m644 ${srcdir}/org.freedesktop.upower.pkla ${pkgdir}/etc/polkit-1/localauthority/50-local.d/
}
