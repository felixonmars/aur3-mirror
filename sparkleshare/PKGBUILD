# Maintainer: Jarek Sedlacek <JarekSedlacek@gmail.com>
# Contributor: Erdbeerkaese <erdbeerkaese underscore arch at gmail dot com>

pkgname=sparkleshare
pkgver=0.8.4
pkgrel=2
pkgdesc="An open-source clone of Dropbox, written in Mono"
arch=('i686' 'x86_64')
url="http://www.sparkleshare.org/"
license=('GPL3')
depends=('mono' 'gtk-sharp-2' 'ndesk-dbus' 'ndesk-dbus-glib' 'intltool' 'webkit-sharp' 'notify-sharp' 'xdg-utils' 'openssh')
optdepends=('gvfs' 'python-nautilus' 'libappindicator')
options=('!libtool' '!makeflags')
source=("https://github.com/downloads/hbons/SparkleShare/sparkleshare-linux-$pkgver.tar.gz"
         "desktop-database.patch")
hash=""
install="sparkleshare.install"

build() {
    mkdir -p $pkgdir/usr/share/sparkleshare/html
    mkdir -p $pkgdir/usr/share/sparkleshare/pixmaps

    cd $srcdir/$pkgname-$pkgver
    #./autogen.sh --prefix=/usr --disable-user-help
    ./configure --prefix=/usr
    make
}

    package(){
    patch -p0 < desktop-database.patch
    cd $srcdir/$pkgname-$pkgver
    make -s DESTDIR=${pkgdir} install
}
md5sums=('2e1ea43f47232d82d2c03c252c0238e5'
         '69da5df7e90f05d544302f2e120af8b1')
