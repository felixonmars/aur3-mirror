# Maintainer: Spyros Stathopoulos <foucault.online@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

pkgname=file-roller2
_pkgname=file-roller
pkgver=2.32.2
pkgrel=3
pkgdesc='Archive manipulator for GNOME2'
arch=('i686' 'x86_64')
url="http://www.gnome.org"
license=('GPL')
groups=('gnome-extra')
depends=('desktop-file-utils' 'gconf>=2.32.0' 'hicolor-icon-theme')
makedepends=('gnome-doc-utils' 'intltool' 'nautilus<=3.0.1.1')
optdepends=('unrar: for RAR uncompression' 
'zip: for ZIP archives' 'unzip: for ZIP archives'
'p7zip: 7zip compression utility' 'arj: for ARJ archives'
'unace: extraction tool for the proprietary ace archive format')
provides=('file-roller')
conflicts=('file-roller')
replaces=('file-roller')
options=('!libtool' '!emptydirs')
install='file-roller.install'
source=("http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('2ec596e237c2f3af1d7d3f5b9c12884f')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr \
    --disable-static \
    --localstatedir=/var \
    --libexecdir=/usr/lib/file-roller \
    --disable-scrollkeeper \
    --disable-schemas-install \
    --sysconfdir=/etc \
    --disable-packagekit
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install
  install -d -m755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_pkgname}.schemas" \
    --domain "${_pkgname}" "${pkgdir}/etc/gconf/schemas/"*.schemas
  rm -f "${pkgdir}/etc/gconf/schemas/"*.schemas
}

# vim:set ts=2 sw=2 et:
