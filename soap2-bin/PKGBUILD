# Contributor: Alex Peltzer <alex.peltzer@gmail.com>
# Maintainer: Alex Peltzer <alex.peltzer@gmail.com>


pkgname=soap2-bin
pkgver=2.21
pkgrel=1
pkgdesc="SOAPaligner/SOAP2 is a tool for short oligonucleotide alignment."
arch=('x86_64')
url="http://soap.genomics.org.cn/soapaligner.html"
license=('GPL3')
source=(http://soap.genomics.org.cn/down/soap2.21release.tar.gz)
md5sums=('563b8b7235463b68413f9e841aa40779')



package() {
  mkdir -p $pkgdir/usr/bin
  cd $srcdir/soap${pkgver}release
  install -Dm755 2bwt-builder $pkgdir/usr/bin/
  install -Dm755 soap $pkgdir/usr/bin/
}
