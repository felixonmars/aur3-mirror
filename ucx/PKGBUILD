# Maintainer: David Roheim <david dot roheim at gmail dot com>
pkgname=ucx
pkgver=15.0.0.5
pkgrel=1
pkgdesc="UltraCompare Professional is a powerful compare/merge application."
arch=('i686' 'x86_64')
url="http://www.ultraedit.com/products/ultracompare-mac-linux.html"
license=('custom')
install=${pkgname}.install
depends=(glibc gdk-pixbuf2 glib2 icu libpng libjpeg-turbo libx11 libxml2 zlib pango)
options=(!strip)

source=("http://www.ultraedit.com/files/ucx/Other/ucx-${pkgver}_amd64.tar.gz")
sha256sums=('75fd7d0937428f2dedbb3d35e104230553f1d716eaccb2e28be71db786b6ea68')

if [ "${CARCH}" = 'i686' ]; then
	source[0]=("http://www.ultraedit.com/files/ucx/Other/ucx-${pkgver}_i386.tar.gz")
	sha256sums[0]=("43c9846eb6e89cbbf8a7f6758654c2bfefc8213498f2af398c4b33a4948e9990")
fi

build() {
  true
}

package() {
  cd "${srcdir}/${pkgname}"
  install -m755 -d ${pkgdir}/opt
  install -m755 -d ${pkgdir}/usr/bin
  install -m755 -d ${pkgdir}/usr/share/menu
  install -m755 -d ${pkgdir}/usr/share/pixmaps
  install -m755 -d ${pkgdir}/usr/share/applications
  install -m755 -d ${pkgdir}/usr/share/licenses/${pkgname}
  
  cp -R ${srcdir}/${pkgname}             ${pkgdir}/opt
  ln -s /opt/ucx/bin/ucx                 ${pkgdir}/usr/bin/ucx
  ln -s /opt/ucx/share/ucx/ucx.xpm       ${pkgdir}/usr/share/pixmaps/ucx.xpm
  ln -s /opt/ucx/share/ucx/ucx.menu      ${pkgdir}/usr/share/menu/ucx.menu
  ln -s /opt/ucx/share/ucx/ucx.desktop   ${pkgdir}/usr/share/applications/ucx.desktop
  ln -s /opt/ucx/share/doc/ucx/copyright ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

