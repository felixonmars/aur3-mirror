# Maintainer: Alex Ferrando <alferpal at gmail dot com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: Gary Wright <wriggary@gmail.com>
# Contributor: Jonathan Tellier <jonathan.tellier@gmail.com>

pkgname=baobab
pkgver=3.2.1
pkgrel=3
pkgdesc="GNOME disk usage analyzer"
arch=('i686' 'x86_64')
url="http://www.marzocca.net/linux/baobab.html"
license=('GPL')
depends=('desktop-file-utils' 'dconf' 'gtk3' 'hicolor-icon-theme' 'libgtop')
makedepends=('intltool' 'gnome-doc-utils')
conflicts=('gnome-utils')
install=${pkgname}.install
source=("http://ftp.gnome.org/pub/gnome/sources/gnome-utils/${pkgver%.*}/gnome-utils-${pkgver}.tar.bz2"
        "no-unneeded-deps.patch")
md5sums=('e4b4abb612127921415387424e65725f'
         'ec88d548020b9a057b719ede513cfe2f')

build() {
  cd "${srcdir}/gnome-utils-${pkgver}"

  # disable check of unneeded deps
  patch -Np1 -i "${srcdir}/no-unneeded-deps.patch"

  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
              --disable-scrollkeeper \
              --disable-schemas-compile \
              --disable-schemas-install

  cd ${pkgname}
  make
}
     
package() {
  cd "${srcdir}/gnome-utils-${pkgver}/${pkgname}"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
