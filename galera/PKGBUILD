# Maintainer: Rustam Tsurik <rustam.tsurik@gmail.com>
# Contributor: Nico Suarez <nicodoggie@gmail.com>

pkgname=galera
pkgver=25.3.10
pkgrel=1
pkgdesc='Galera WSREP provider'
arch=('i686' 'x86_64' 'mips64el')
license=('GPL2' 'custom:OpenSSL Linking Exception')
depends=('openssl')
makedepends=('boost>=1.58' 'check' 'scons' 'patch')
url='http://www.codership.com'
options=('!libtool')
source=(https://github.com/codership/galera/archive/release_${pkgver}.tar.gz)
sha512sums=('c08420b72e446c93645012ec04465c4cb65152bd3eaa840142fafdcb6945f76e77e2be00cf68930227656b78c25cd5ce36ebe823d6fcbcd320e6ae91b3b38a5c')

prepare() {
  cd "$pkgname-release_$pkgver"
  # makes build fail on 25.3.10
  sed "s/-Werror//g" -i SConstruct
}

build(){
  cd "$pkgname-release_$pkgver"
  scons
}

package(){
  cd "$pkgname-release_$pkgver"
  install -Dm0644 libgalera_smm.so "$pkgdir"/usr/lib/libgalera_smm.so
  install -Dm0755 garb/garbd "$pkgdir"/usr/bin/garbd
  install -Dm0644 scripts/packages/README "$pkgdir"/usr/share/doc/galera/README
  install -m0644 scripts/packages/README-MySQL "$pkgdir"/usr/share/doc/galera/README-MySQL
  install -m0644 COPYING "$pkgdir"/usr/share/doc/galera/COPYING
}
