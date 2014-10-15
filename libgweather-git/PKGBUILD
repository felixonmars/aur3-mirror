# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=libgweather
pkgname=$_pkgname-git
pkgver=3.14.0
pkgrel=1
pkgdesc="Provides access to weather information from the net"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libsoup' 'gnome-icon-theme' 'gtk3' 'geocode-glib')
makedepends=('git' 'intltool' 'gtk-doc' 'gobject-introspection' 'gnome-common')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org/"
install=libgweather.install
replaces=('libgweather')
provides=('libgweather=3.14.0')
conflicts=('libgweather')
source=(git://git.gnome.org/libgweather
        gettext-not-xml.patch
        no_external_gettext.patch)
sha256sums=('SKIP'
            '40325e0b5464ebb75eaad3c9292c0bab7b15cfefb93011d9ccc0ab82635a9533'
            'f07ac07a70ad4999c3acd5d5b82aabd8831e6a45beb9aaed239f212057ded672')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --always | sed 's|-|.|g'
}

build() {
    cd "$srcdir/$_pkgname"
    CC=/usr/bin/gcc ./autogen.sh --prefix=/usr --sysconfdir=/etc \
        --localstatedir=/var --disable-static \
        --enable-locations-compression --enable-gtk-doc
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install
}
