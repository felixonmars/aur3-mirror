# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>

pkgname=solang
pkgver=0.4.1
pkgrel=2
pkgdesc="A photo manager for GNOME"
url="http://projects.gnome.org/solang/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gdl>=1.0' 'gtkimageview' 'gtkmm>=2.8' 'gegl' 'geglmm>=0.1' 'tracker>=0.8.0' 'libarchive>=2.8.0')
optdepends=('brasero>=2.28.3: to burn selected photos to a CD/DVD')
makedepends=('intltool' 'gnome-doc-utils')
install=solang.install
source=(http://ftp.twaren.net/Unix/NonGNU/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('28386021b88357aa6e2d1e6bbc1d6a2c')
         
build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --sysconfdir=/etc || return 1
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir}/ install || return 1
}
