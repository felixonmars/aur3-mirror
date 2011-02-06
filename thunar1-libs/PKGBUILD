
# Maintainer: Kurt J. Bosch <kujub at quantentunnel dot de>
# Contributor: tobias <tobias funnychar archlinux.org>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

pkgname=thunar1-libs
pkgver=1.0.1
pkgrel=1
pkgdesc="new modern file manager for Xfce - lib files only"
arch=(i686 x86_64)
license=('GPL2' 'LGPL2')
url="http://thunar.xfce.org"
groups=('xfce4')
depends=('desktop-file-utils' 'libexif>=0.6.17' 'xfce4-panel>=4.6.1' 'hicolor-icon-theme' 'fam')
makedepends=('intltool' 'pkgconfig')
optdepends=('gamin:   a fam replacement to make thunar monitor changes to files on the fly')
options=('!libtool')
install=${pkgname}.install
source=(http://www.xfce.org/archive/xfce-4.6.1/src/Thunar-${pkgver}.tar.bz2)
md5sums=('218373aa45d74b6ba8c69c4d5af3bb19')

build() {
  cd ${srcdir}/Thunar-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --disable-static \
    --disable-gnome-thumbnailers --enable-exif --enable-pcre
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  sed -i 's:x-directory/gnome-default-handler;::' \
    ${pkgdir}/usr/share/applications/Thunar-folder-handler.desktop
    
  ## remove all the stuff now provided by thunar 2
  rm -rf ${pkgdir}/{etc,usr/bin,usr/lib/xfce4,usr/share}
  rm -rf ${pkgdir}/usr/lib/{ThunarBulkRename,ThunarHelp,thunar-sendto-email,xfce4}
}
