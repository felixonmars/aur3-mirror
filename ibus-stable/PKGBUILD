_pkgname=ibus
pkgname=${_pkgname}-stable
pkgver=1.4.2
pkgrel=1
conflicts=(${_pkgname})
provides=(${_pkgname}=${pkgver})
pkgdesc="Next Generation Input Bus for Linux"
arch=('i686' 'x86_64')
url="http://ibus.googlecode.com"
license=('LGPL')
depends=('python2-dbus' 'gconf' 'dconf' 'python2-xdg' \
         'iso-codes' 'librsvg' 'python2-notify' 'hicolor-icon-theme')
makedepends=('intltool' 'gobject-introspection')
optdepends=('notification-daemon')
options=('!libtool')
install=ibus.install
source=(http://ibus.googlecode.com/files/${_pkgname}-${pkgver}.tar.gz)
sha1sums=('a2d11d8bb64761691df918e9e50f0b35c711760d')

build() {
  cd ${_pkgname}-${pkgver}
  export PYTHON=python2
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/ibus \
    --sysconfdir=/etc \
    --with-gconf-schema-file-dir=/usr/share/gconf/schemas \
    --enable-gtk3
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/etc/xdg/autostart"
  ln -s /usr/share/applications/ibus.desktop "${pkgdir}/etc/xdg/autostart/ibus.desktop"
}
