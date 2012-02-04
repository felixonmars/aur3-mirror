# Contributor: Carlos Ruiz <cailovirtual@gmail.com>
# Maintainer: Nathan Owe <ndowens04+AUR at gmail.com>
pkgname=cdcollect
pkgver=0.6.0
pkgrel=2
pkgdesc="CD catalog application for gnome."
url="http://cdcollect.sourceforge.net"
license=('GPL2')
arch=('i686')
depends=('gtk2' 'gtk-sharp-2' 'mono' 'gconf' 'sqlite3')
source=(http://downloads.sourceforge.net/cdcollect/$pkgname-$pkgver.tar.bz2)
md5sums=('33f71604b9dfb84497b4bc2fce69e89b')


build() {
        cd $srcdir/$pkgname-$pkgver
       export MONO_SHARED_DIR=$srcdir
        ./configure --prefix=/usr --sysconfdir=/etc
        make || return 1
        make DESTDIR=$pkgdir install
}

