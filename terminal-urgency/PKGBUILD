# Maintainer: Radim Hvizdák <radim.hvizdak@seznam.cz>
# Contributor: Bernhard Walle <bernhard.walle@gmx.de>
# Contributor: aurelien <aurelien@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>
# AUR Category: xfce

pkgname=terminal-urgency
pkgver=0.4.0
pkgrel=1
pkgdesc="Xfce terminal with patch that sets urgency hint on bell (needs vte-svn)"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/projects/terminal/"
groups=('xfce4')
depends=('exo>=0.3.101' 'vte>=0.20.5' 'dbus-glib>=0.80'
	 'startup-notification>=0.9' 'hicolor-icon-theme')
makedepends=('pkgconfig')
options=('!libtool')
install=terminal.install
source=(http://www.xfce.org/archive/src/apps/terminal/0.4/Terminal-${pkgver}.tar.bz2
	terminal-dont-die-on-dbus-kill.patch
	Terminal-beep-urgencyhint.patch)
md5sums=('07efc1c2a2f2a08d06c110ff206fa836' '7cff5c513739737a0ed2109354538241'
         'fb48f437b01080c91aba01d3888db4c1')
provides=('terminal')

build() {
	  cd ${srcdir}/Terminal-${pkgver}
	    patch -Np0 -i ${srcdir}/terminal-dont-die-on-dbus-kill.patch || return 1
	      cd terminal
	        patch -Np0 -i ${srcdir}/Terminal-beep-urgencyhint.patch || return 1
		  cd - &> /dev/null
		    ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
		        --localstatedir=/var --disable-static || return 1
			  make || return 1
			    make DESTDIR=${pkgdir} install || return 1
}

# :tabSize=8:noTabs=false:mode=shellscript:
