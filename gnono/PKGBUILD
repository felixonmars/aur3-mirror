# Contributor: rabyte <rabyte__gmail>

pkgname=gnono
pkgver=1.9.1
pkgrel=5
pkgdesc="A GNOME version of the classic card game UNO"
arch=('i686')
url="http://sourceforge.net/projects/gnono/"
license=('GPL')
depends=('libgnomeui>=2')
makedepends=('pkgconfig' 'perlxml')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('b147fc2c4c7cea5ed16a31a0fba5c4d8')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}

  # Replace deprecated GTK_SIGNAL_FUNC with G_CALLBACK
  sed -i 's|GTK_SIGNAL_FUNC|G_CALLBACK|g' src/{interface,preferences}.c

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install

  install -Dm644 pixmaps/gnono-48x48.png ${pkgdir}/usr/share/pixmaps/gnono.png
  install -Dm644 gnono.desktop ${pkgdir}/usr/share/applications/gnono.desktop
}
