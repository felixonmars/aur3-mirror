pkgname=timer-applet
pkgver=2.2beta1
pkgrel=3
pkgdesc="A countdown timer applet for the GNOME panel"
arch=(i686 x86_64)
url="http://launchpad.net/timer-applet"
license=('GPL2')
depends=('gnome-python-desktop>=2.18' 'python-notify>=0.1.1' 'dbus-python>=0.80' 'gstreamer0.10-python' 'intltool>=0.35.0')
source=(http://launchpad.net/timer-applet/2.2/2.2b1/+download/timer-applet-${pkgver}.tar.gz 
py-compile.diff timer-applet.diff)
md5sums=('30eb9df45e7578a9de0ac451c5f25a92' 'b7d100c889b926b894efa11c1159a0a5' '967a191ca673aec93546640002c794ab')
build() {
cd $startdir/src/$pkgname

patch py-compile $startdir/py-compile.diff
patch src/timer-applet $startdir/timer-applet.diff

./configure PYTHON=python2 --prefix=/usr sysconfdir=/etc || return 1
make || return 1
make PYTHON=python2 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
rm -rf ${startdir}/pkg/etc
}
