# Contributor: Ricardo Honorato-Zimmer <rata@cbuc.cl>

pkgname=conan
pkgver=1.0rc1
pkgrel=1
pkgdesc="COmplex Network ANalysis - C++/Python library to construct, analize and infere complex networks"
arch=('i686' 'x86_64')
url="http://www.cbuc.cl/projects/conan/"
license=('GPL3')
depends=('boost' 'gsl' 'python')
makedepends=('make' 'gcc' 'subversion')
conflicts=('conan-svn')
source=("http://www.cbuc.cl/projects/conan/raw-attachment/wiki/GetConan/${pkgname}-${pkgver}.tar.bz2")
md5sums=('0471b625402a227fa4ad125fa95e1134')

build() {
  msg "Building and installing Conan..."
  cd ${srcdir}/${pkgname}-${pkgver}/
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
