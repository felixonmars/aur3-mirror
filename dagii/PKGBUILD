# Contributor: robb_force <robb_force@holybuffalo.net>
pkgname=dagii
pkgver=0.4.1
pkgrel=1
pkgdesc="Dave's AGI Interpreter is a re-implementation of Sierra's Adventure Game Interpreter (AGI)."
url="http://www.dagii.org/"
license="GPL"
arch=('i686')
depends=('sdl>=1.2.9' 'libpng>=1.2.8')
makedepends=('zlib')
source=(http://www.dagii.org/dist/${pkgname}-${pkgver}.tar.gz)
install=dagii.install
md5sums=('e4a315444a7e170d69772755b5b7c8a2')

build() {
  # Fix a path error
  cd ${startdir}/src/${pkgname}-${pkgver}/src
  sed -e "s|/sw/|/usr/|g" -i depend.1

  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1

  # Install the executable
  install -Dm755 src/${pkgname} ${startdir}/pkg/usr/bin/${pkgname}
}
