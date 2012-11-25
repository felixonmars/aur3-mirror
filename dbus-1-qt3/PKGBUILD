# Contributor: Shem Valentine <archlinux@valentinenews.net>
pkgname=dbus-1-qt3
pkgver=0.9
pkgrel=8
arch=('i686' 'x86_64')
pkgdesc="DBUS/Qt3 bindings."
url="http://www.freedesktop.org/wiki/Software/DBusBindings"
license=('GPL')
depends=('dbus' 'qt3')
source=(http://people.freedesktop.org/~krake/dbus-1-qt3/${pkgname}-${pkgver}.tar.gz)
md5sums=('8ca3d13c372126aa9b0e16beb0a9d82d')

build() {
    cd $srcdir/$pkgname-$pkgver

    . /etc/profile.d/qt3.sh
    ./configure --prefix=$QTDIR
    make || return 1
    make DESTDIR="$pkgdir/" install
   
    # Libtool slay
    find $startdir/pkg -name *.la -exec rm {} \;
}

