# Contributor: Alex Peltzer <alex.peltzer@gmail.com>
# Maintainer: Alex Peltzer <alex.peltzer@gmail.com>

pkgname=razers
pkgver=3.1.1
pkgrel=1
pkgdesc="RazerS is a read mapping program with adjustable sensitivity based on counting q-grams. I"
arch=('x86_64')
url="http://www.seqan.de/projects/razers/"
license=('GPL')
depends=('cmake')
source=("http://packages.seqan.de/razers3/razers3-3.1.1-Linux-x86_64.zip")
md5sums=('2a8b15580a138ea38057bb65ac3fc741')


package() {
    mkdir -p ${pkgdir}/usr/bin/
    install -Dm755 ${srcdir}/${pkgname}3-${pkgver}-Linux-${arch}/bin/razers3 ${pkgdir}/usr/bin
  
}






