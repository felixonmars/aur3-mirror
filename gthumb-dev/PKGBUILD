# Maintainer: garrett18 <garrett16 at hotmail dot it>

pkgname=gthumb-dev
_realname=gthumb
pkgver=2.13.1
pkgrel=1
pkgdesc="Image browser and viewer for the GNOME Desktop"
arch=('i686' 'x86_64')
license=('GPL')
url="http://live.gnome.org/gthumb"
depends=('clutter-gtk' 'desktop-file-utils' 'exiv2' 'hicolor-icon-theme')
makedepends=('brasero' 'gnome-doc-utils' 'gstreamer0.10-base' 'intltool' 'libsm')
optdepends=('brasero: burn disc support'
            'gstreamer0.10-base: video support')
provides=(${_realname})
conflicts=(${_realname} ${_realname}-git)
options=('!libtool' '!emptydirs')
install=${pkgname}.install
source=(http://ftp.gnome.org/pub/GNOME/sources/${_realname}/${pkgver%.*}/${_realname}-${pkgver}.tar.bz2)
sha256sums=('3b124e1b3ae5a3496d9392c11052792e5168535b849756b53cefd9d7b1e8e7b9')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static
  make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"

  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -d -m755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_realname}.schemas" \
    --domain "${_realname}" "${pkgdir}"/etc/gconf/schemas/*.schemas
  rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas
}

