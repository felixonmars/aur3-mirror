# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=ubee512
pkgver=5.4.0
pkgrel=2
pkgdesc="An emulator of the MicroBee Z80 series of microcomputers"
arch=('i686' 'x86_64')
url="http://freecode.com/projects/ubee512"
license=('GPL')
depends=('libdsk' 'libgl' 'sdl' 'z80ex' 'zziplib')
source=("http://www.microbee-mspp.org.au/repository/content.php?get_action=download&secure_token=c83ba7a165543f853113e5d67ab9e483&file=%2FProjects%2Fubee512%2Fubee512-5.4.0%2Fubee512-5.4.0.tar.gz")
md5sums=('881fbe3aac1e6615bc295e73c365a0f4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  sed -i "s_/usr/local_/usr_g" Makefile
  make OPT_LIBDSK=2 OPT_ZZIPLIB=2 OPT_Z80_STATIC=0
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  make DESTDIR="${pkgdir}" install
}
