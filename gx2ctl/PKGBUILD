
# Maintainer: Kurt J. Bosch <kjb-temp-2009 at alpenjodel dot de>

pkgname=gx2ctl
pkgver=0.1.2
pkgrel=2
pkgdesc="A GNOME xmms2 control client, written in glade2/gtk+ C"
arch=('i686')
url="http://mir.dnsalias.com/oss/xmms2/gx2ctl"
license=('GPL')
depends=('xmms2=0.5DrLecter' 'gtk2' 'libgnomeui')
makedepends=()
conflicts=()
source=("http://mir.dnsalias.com/_media/oss/xmms2/${pkgname}-${pkgver}.tar.gz"
        "gx2ctl.desktop")

md5sums=('e840152f1dc4f9aedb81edc63c65f956'
         '3d880a4f0f0f13fb60a021d08d09a590')

build()
{
  cd "${srcdir}"/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  ln -s gx2ctl/gx2ctl-64.xpm "${pkgdir}"/usr/share/pixmaps/gx2ctl.xpm
  mkdir -p "${pkgdir}"/usr/share/applications/
  install -m 644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/
}
