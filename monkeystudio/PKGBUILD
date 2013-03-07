# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Phil Miller <philm[at]chakra-project[dot]org
# Contributor: Luca Bennati <lucak3 AT gmail DOT com>
# Contributor: Laurent Navet <laurent.navet AT gmail DOT com>

pkgname=monkeystudio
pkgver=1.9.0.4
pkgrel=1
pkgdesc="Crossplatform IDE written in C++/Qt4"
arch=('i686' 'x86_64')
url="http://monkeystudio.org"
license=('GPL')
depends=('qscintilla' 'qtwebkit')
conflicts=('monkeystudio2-svn')
source=("http://monkeystudio.googlecode.com/files/mks_${pkgver}-src.tar.gz")
md5sums=('1b76fdaf9293ab160ca90ff919440598')

build() {
  cd "${srcdir}/mks_${pkgver}-src"
  qmake-qt4 -recursive prefix=/usr
  make
}

check() {
  cd "${srcdir}/mks_${pkgver}-src"
  make -k check
}

package() {
  cd "${srcdir}/mks_${pkgver}-src"
  qmake-qt4 prefix="${pkgdir}/usr"
  make install
}

# vim:set ts=2 sw=2 et:
