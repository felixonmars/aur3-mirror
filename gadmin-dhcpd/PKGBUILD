# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=gadmin-dhcpd
pkgver=0.5.0
pkgrel=1
pkgdesc="An easy to use GTK+ application to administer DHCPD"
arch=('i686' 'x86_64')
url="http://gadmintools.flippedweb.com/index.php?option=com_content&task=view&id=18&Itemid=32"
license=('GPL')
depends=('gtk2')
optdepends=('gksu: Graphical SU Support')
source=("http://mange.dynalias.org/linux/${pkgname}/${pkgname}-${pkgver}.tar.gz" "${pkgname}.desktop" "${pkgname}-menu" )
md5sums=('300e7b1fb8bad829a9f05bbd57783a26'
         'a646a26d9ac8af337abf43e08cdfe7b6'
         'bbff64e9a70afb32d814ebdfa3eb9170')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -Dm755 ${srcdir}/${pkgname}-menu ${pkgdir}/usr/sbin/${pkgname}-menu
  install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
