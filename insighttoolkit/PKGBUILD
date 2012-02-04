pkgname=insighttoolkit
pkgver=3.20
pkgrel=0
pkgdesc="ITK is an open-source, cross-platform system that provides developers with an extensive suite of software tools for image analysis."
arch=('i686' 'x86_64')
license=('custom')
url="http://www.itk.org"
depends=('expat' 'curl' 'gcc-libs' 'shared-mime-info')
makedepends=('cmake')
optdepends=()
#install="InsightToolkit.install"
source=("http://www.itk.org/files/v3.20/InsightToolkit-${pkgver}.${pkgrel}.tar.gz")
md5sums=('5d6b8e6e641624c6a8c06c7f95f05c9e')

build() {
  cd ${srcdir}/InsightToolkit-${pkgver}.${pkgrel}

  cmake . 

  make
}

package() {
  cd ${srcdir}/InsightToolkit-${pkgver}.${pkgrel}
  make DESTDIR=${pkgdir} install

  install -Dm644 Copyright.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
