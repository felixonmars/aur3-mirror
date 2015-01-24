# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>
pkgname=tcpdstat
pkgver=1.8
pkgrel=2
pkgdesc="TCP/IP statistical analysis tool"
arch=('i686' 'x86_64')
license=('custom')
url="http://staff.washington.edu/dittrich/talks/core02/tools/tools.html"
depends=('libpcap')
source=(http://staff.washington.edu/dittrich/talks/core02/tools/$pkgname-uw.tar
        LICENSE
        $pkgname.patch)
md5sums=('64b246fb0a4ee47ae37e83d721b205df'
         '3d93d31bcb2f45ea922094857000d40e'
         '221befa2388fb5f106f64170547a612d')

build() {
  
  cd ${srcdir}/$pkgname-uw
  patch -Np1 -i "${srcdir}/$pkgname.patch" || return 1
  make || return 1

}

package() {

  cd ${srcdir}/$pkgname-uw
  install -Dm755 $pkgname \
      ${pkgdir}/usr/bin/$pkgname || return 1
  install -Dm644 ${srcdir}/LICENSE \
      ${pkgdir}/usr/share/licenses/$pkgname/LICENSE || return 1

}
