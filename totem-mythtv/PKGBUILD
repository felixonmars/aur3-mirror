# Contributor: twa022 <twa022@gmail.com>

pkgname=totem-mythtv
pkgver=2.28.4
pkgrel=1
url="http://projects.gnome.org/totem/"
pkgdesc="Mythtv plugin for Totem."
arch=(i686 x86_64)
license=('GPL')
depends=("totem>=$pkgver" 'gmyth>=0.7.1' 'gmyth-upnp>=0.7.1')
makedepends=('pkgconfig' 'intltool' 'gnome-doc-utils>=0.16.0')
options=('!libtool' '!emptydirs')
install=${pkgname}.install
## Is the .schemas file necessary, one does not get created with make
source=(http://ftp.gnome.org/pub/gnome/sources/totem/2.28/totem-${pkgver}.tar.bz2
        ${pkgname}.schemas)

build() {
  cd "${srcdir}/totem-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
    --libexecdir=/usr/lib/totem \
    --localstatedir=/var --disable-static \
	--disable-browser-plugins \
	--with-dbus --enable-python \
	--disable-scrollkeeper --disable-nautilus || return 1
  cd src/plugins/mythtv
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  install -D -m644 ${srcdir}/${pkgname}.schemas ${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas
}

md5sums=('a08fca39db3c3e7885c584e0fd533f5a'
         '3f4336a62214dbf9e93ce3d92c718d96')
