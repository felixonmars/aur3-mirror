# $Id: PKGBUILD 55139 2009-10-12 07:31:24Z jgc $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Javier Leonario <jano@live.cl>

pkgname=nautilus-rgba
_pkgname=nautilus
pkgver=2.28.2
pkgrel=1
pkgdesc="The GNOME shell and file manager with RGBA Support"
arch=(i686 x86_64)
license=('GPL')
depends=('libbeagle>=0.3.9' 'libtracker>=0.6.95' 'libexif>=0.6.16' 'exempi>=2.1.0' 'gnome-icon-theme>=2.27.90' 'desktop-file-utils' 'gvfs>=1.4.0' 'libunique>=1.1.2' 'gnome-desktop>=2.28.0')
makedepends=('pkgconfig' 'intltool')
url="http://www.gnome-look.org/content/show.php/Nautilus+RGBA+support?content=85094"
conflicts=(nautilus)
groups=('gnome')
options=('!libtool' '!emptydirs')
install=nautilus.install
source=(http://ftp.acc.umu.se/pub/GNOME/sources/nautilus/2.28/$_pkgname-$pkgver.tar.bz2
	nautilus-condrestart.patch
	nautilus-desktop-window_c.patch
	nautilus-window_c.patch)
md5sums=('e759af11a0844828e2b484ff42ee0498'
         '0cf5cdf512388a98ea1cf25f72ddcc6d'
         '7e6b93653f15d4fc6aeefc6e14cd9212'
         'eedfa7551cf60e1c5d39daedb2eddcd3')


build() {
  cd "${srcdir}/nautilus-${pkgver}"
  patch -Np1 -i "${srcdir}/nautilus-window_c.patch" || return 1
  patch -Np1 -i "${srcdir}/nautilus-desktop-window_c.patch" || return 1
  patch -Np1 -i "${srcdir}/nautilus-condrestart.patch" || return 1
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --disable-update-mimedb || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1
  
  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_pkgname}.schemas" --domain nautilus ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
