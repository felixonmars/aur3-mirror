# Contributor: Mladen Pejaković <pejakm@gmail.com>
pkgname=unalz
pkgver=0.65
pkgrel=2
pkgdesc="Decompression program for alzip format files"
url="http://www.kipple.pe.kr/win/unalz/"
depends=('bzip2')
arch=('x86_64' 'i686')
license=('zlib')
source=(http://www.kipple.pe.kr/win/unalz/${pkgname}-${pkgver}.tgz)
md5sums=('e4db2c4e3c8f6f5ee414b68bc55288e5')

build()
{
  cd ${srcdir}/${pkgname}
  make linux-utf8
}

package()
{
  cd ${srcdir}/${pkgname}
  install -D -m 755 ${srcdir}/${pkgname}/unalz ${pkgdir}/usr/bin/unalz
  install -D -m 644 ${srcdir}/${pkgname}/readme.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}