# Maintainer: Simplet <simplet AT ptigeek _DOT_ net>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=nautilus-no-deletekey
pkgver=2.32.1
pkgrel=1
pkgdesc="The GNOME shell and file manager - No Delete Key Patch"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libexif>=0.6.19' 'gnome-desktop>=2.32.0' 'exempi>=2.1.1' 'libunique>=1.1.6' 'hicolor-icon-theme' 'gvfs>=1.6.6' 'desktop-file-utils')
makedepends=('intltool' 'gobject-introspection' 'namcap')
replaces=('gnome-volume-manager')
url="http://www.gnome.org"
groups=('gnome')
options=('!libtool' '!emptydirs')
install=nautilus.install
source=(http://ftp.gnome.org/pub/gnome/sources/nautilus/2.32/nautilus-${pkgver}.tar.bz2
        nautilus-condrestart.patch
	nautilus-nodelkey.patch)
sha256sums=('3d7291682ed0cdfe95f5faf80104528f0affb26330007f08dd7a41d7e21b0349'
           'f825292ef26274d3044272ca9f25095391cc49d30fb0056e7ed7346a1b4d106c'
           '67e3cfd886ae966dab9524ddcfa0e2f748b608a7aababf9ac72e50d2cf76aa6c')

build() {
  cd "${srcdir}/nautilus-${pkgver}"
  patch -Np1 -i "${srcdir}/nautilus-condrestart.patch"
  patch -Np1 -i "${srcdir}/nautilus-nodelkey.patch"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/nautilus \
      --disable-update-mimedb \
      --disable-packagekit
  make
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/nautilus.schemas" --domain nautilus ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
