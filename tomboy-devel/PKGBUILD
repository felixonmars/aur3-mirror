# Adapted from official tomboy package
# Maintainer: Prurigro

pkgname=tomboy-devel
_pkgname=tomboy
pkgver=1.11.4
pkgrel=1
pkgdesc="Desktop note-taking application for Linux and Unix, Windows, and Mac OS X (Development Release)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://projects.gnome.org/tomboy"
depends=('gtk2' 'gtkspell' 'gconf' 'gconf-sharp' 'dbus-sharp' 'dbus-sharp-glib' 'mono-addins' 'hicolor-icon-theme')
makedepends=('intltool' 'pkgconfig'  'gnome-doc-utils')
options=('!libtool' '!emptydirs' '!makeflags')
groups=('gnome-extra')
provides=('tomboy')
conflicts=('tomboy')
install=tomboy.install

source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz)
sha256sums=('4030db790c4a0fe65f27f4bcba54d4ec5947d85d98d3447f02341d4f33b221bf')

build() {
    export MONO_SHARED_DIR="$srcdir/.wabi"
    mkdir -p "$MONO_SHARED_DIR"

    pushd "$_pkgname-$pkgver"
        ./configure --prefix=/usr --sysconfdir=/etc \
            --localstatedir=/var \
            --disable-update-mimedb
        make
    popd
}

package() {
    pushd "$_pkgname-$pkgver"
        make DESTDIR="$pkgdir" GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 install

        install -m755 -d "$pkgdir/usr/share/gconf/schemas"
        gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/$_pkgname.schemas" --domain tomboy "$pkgdir"/etc/gconf/schemas/*.schemas
        rm -f "$pkgdir"/etc/gconf/schemas/*.schemas
    popd
}
