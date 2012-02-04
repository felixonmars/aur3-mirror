# Maintainer: Dan Serban
# Contributor: TDY <tdy@gmx.com>
# Contributor: M Rawash <mrawash@gmail.com>

pkgname=gnac-xfce
pkgver=0.2.3
pkgrel=1
pkgdesc="GNome Audio Converter, made lighterweight for XFCE"
arch=(i686 x86_64)
url=http://gnac.sourceforge.net/
license=(GPLv3)
depends=(gstreamer0.10-base-plugins)
makedepends=(gnome-doc-utils intltool pkgconfig)
install=gnac.install
conflicts=(gnac)
source=("http://downloads.sourceforge.net/gnac/gnac-${pkgver}.tar.bz2"
        "gnac-0.2.3-libnotify7.diff")
md5sums=('3268bc62e943890670c408db7ba33d76'
         '13c2dcf2ac6039e31395c9756a7df945')

build()
{
  cd "gnac-${pkgver}"
  patch -Np1 -i ../gnac-$pkgver-libnotify7.diff
  ./configure --prefix=/usr
  make
}

package()
{
  cd "gnac-${pkgver}"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
}

