# Maintainer: Ryan Young <ry an. ry. young@gmail.com> (omit spaces)
pkgname=connman-gnome-git
_gitname=connman-gnome
pkgver=0.0.0
pkgrel=1
pkgdesc="A connman GNOME user interface"
arch=('i686' 'x86_64')
url="https://git.kernel.org/cgit/network/connman/connman-gnome.git"
license=('GPL2')
depends=('connman' 'gtk2' 'dbus-glib' 'hicolor-icon-theme')
makedepends=('intltool')
conflicts=('connman-gnome')
provides=('connman-gnome')
source=('git://git.kernel.org/pub/scm/network/connman/connman-gnome.git')
install='connman-gnome.install'
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    git describe --always | sed 's|-|.|g'
}
build() {
    cd $_gitname
    ./bootstrap
    ./configure --prefix=/usr CFLAGS=-Wall
    make
}
package() {
    cd $_gitname
    make DESTDIR="$pkgdir" install
    # move misplaced files
    mkdir -p ${pkgdir}/etc/xdg/autostart
    mv ${pkgdir}/usr/etc/xdg/autostart/* ${pkgdir}/etc/xdg/autostart
    rm -rf ${pkgdir}/usr/etc
}
