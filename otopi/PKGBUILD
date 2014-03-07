# Maintainer: hauzer <alokinpwn@gmail.com>
pkgname=otopi
pkgver=1.1.4
pkgrel=1
pkgdesc="tool for ovirt-engine."
arch=('i686' 'x86_64')
url="http://ovirt.org"
makedepends=('maven3' 'python' 'python2' )
depends=('sh' 'java-runtime' 'java-environment')
license=('GPL3')
source=(http://resources.ovirt.org/releases/3.3.4/src/${pkgname}-${pkgver}.tar.gz)
md5sums=('f2668712dee9185704d2d8fa4b31bfd6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure  \
	PYTHON=python2.7 \
	--prefix=/usr --sbindir=/usr/bin \
        --disable-python-syntax-check 

        make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
