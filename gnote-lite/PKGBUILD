# Maintainer: Bartek Piotrowski <barthalion@gmail.com>
# Contributor: bmpvieira <mail AT bmpvieira DOT com>
# Contributor: uastasi <uastasi@archlinux.us>

pkgname=gnote-lite
pkgver=0.7.5
pkgrel=1
pkgdesc="Experimental port of Tomboy to C++, without the libpanelappletmm dependency. Suitable for non-Gnome environments."
arch=('i686' 'x86_64')
url="http://live.gnome.org/Gnote"
license=('GPL')
depends=('boost>=1.41' 'gtkspell' 'libxslt' 'gconf' 'gtkmm' 'dbus-c++-gitorious')
makedepends=('intltool' 'gnome-doc-utils')
conflicts=('gnote')
options=('!libtool')
install=gnote.install
source=(http://ftp.gnome.org/pub/gnome/sources/gnote/0.7/gnote-$pkgver.tar.bz2)

build() {
    cd "${srcdir}/gnote-${pkgver}"

    export CXXFLAGS="${CXXFLAGS} -DBOOST_FILESYSTEM_VERSION=2"
    ./configure --prefix=/usr \
                --sysconfdir=/etc \
              	--localstatedir=/var \
	            --libexecdir=/usr/lib/gnote \
	            --disable-scrollkeeper \
	            --disable-schemas-install \
	            --disable-static \
	            --disable-applet 
    make
}

package() {
    cd "${srcdir}/gnote-${pkgver}"

    make DESTDIR="${pkgdir}" install || return 1
    install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
    gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/gnote.schemas" --domain gnote ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
    rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}

md5sums=('579e70d23dc568eae8d2f303464f5672')
