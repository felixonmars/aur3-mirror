#Contributor: allencch <allencch at hotmail dot com>
pkgname=clam-chordata
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to discover the chords of your audio files."
arch=('i686' 'x86_64')
url="http://clam-project.org/"
license=('GPL')
depends=('clam>=1.3.0' 'clam-networkeditor>=1.4.0')
source=(http://clam-project.org/download/src/chordata-${pkgver}.tar.gz)
md5sums=('4f6fc0de7978d0d94c839540635baa79')

build() {
  install -d ${pkgdir}/usr

  declare -x QTDIR="/usr"
  
  cd ${srcdir}/chordata-${pkgver}
  scons clam_prefix=/usr prefix=${pkgdir}/usr || return 1
  scons install
}
