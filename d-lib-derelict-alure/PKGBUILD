# Contributor: Brix <brix@brix-verden.dk>

pkgname=d-lib-derelict-alure
pkgver=1.0
pkgrel=1
pkgdesc="Alure (OpenAL utility library) binding for the D Programming Language."
url="http://soulbreakers.com/usr/darkman/d/derelict/alure/"
arch=('i686', 'x86_64')
license=('custom')
depends=('d-lib-derelict' 'alure')
source=('http://stdrand.com/darkman/d/derelict/alure/derelict-alure.zip')
md5sums=('c2870bc96a0030c45ba92415143d2b84')

build() {
  cd ${srcdir}
  
  mkdir -p ${pkgdir}/usr/include/d/derelict
  
  cp -r DerelictALURE/derelict ${pkgdir}/usr/include/d || return 1
  chmod 0666 ${pkgdir}/usr/include/d/derelict/openal/alure.d
  
  find ${pkgdir} -depth -type d -name ".svn" -exec rm -r {} ';'
}
