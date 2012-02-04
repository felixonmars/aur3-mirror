# $Id$
# Maintainer: David C. Rankin <drankinatty@gmail.com>

pkgname=trinity-dbus-1-qt3
pkgver=0.9
pkgrel=8
arch=('i686' 'x86_64')
pkgdesc="DBUS/Qt3 bindings."
url="http://www.freedesktop.org/wiki/Software/DBusBindings"
license=('GPL')
groups=('trinity-base')
pkgdesc="Trinity - dbus-1-qt3"
depends=('dbus' 'trinity-qt3' 'networkmanager')
provides=('trinity-dbus-1-qt3' 'dbus-1-qt3')
conflicts=('dbus-1-qt3')
replaces=('dbus-1-qt3')
options=('libtool' '!strip')
source=(http://people.freedesktop.org/~krake/dbus-1-qt3/${pkgname#*trinity-}-${pkgver}.tar.gz)
md5sums=('8ca3d13c372126aa9b0e16beb0a9d82d')

build() {
    cd $srcdir/${pkgname#*trinity-}-$pkgver

    . /etc/profile.d/qt3.sh
    ./configure --prefix=$QTDIR
    make || return 1
    make DESTDIR="$pkgdir/" install

    # Libtool slay
#     find $startdir/pkg -name *.la -exec rm {} \;
}
