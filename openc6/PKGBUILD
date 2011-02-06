# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=openc6
pkgver=0.9.9
pkgrel=2
pkgdesc="A free instant messenger client which implements the C6 protocol"
arch=('i686' 'x86_64')
url="http://openc6.sourceforge.net"
license=('GPL')
depends=('kdelibs3' 'libxss')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz
        openc6.desktop)
options=(!libtool)
md5sums=('04540266f30620c48ad098e752396a25'
         '5963618628972b1a97c2e3007d6e88ca')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  source /etc/profile.d/qt3.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  install -D -m644 ${srcdir}/openc6.desktop "${pkgdir}/usr/share/applications/kde4/openc6.desktop" || return 1

  # Install plugin
  cd plugins/kdegui

  ./configure --prefix=/usr/share/OpenC6 \
              --without-arts
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
