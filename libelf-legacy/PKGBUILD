# Maintainer: Scott Tincman <sctincman@gmail.com>

pkgname=libelf-legacy
_pkgname=libelf
pkgver=0.8.13
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.mr511.de"
license=('LGPL')
depends=('glibc')
#provides=('libelf')
provides=()
source=("http://www.mr511.de/software/${_pkgname}-${pkgver}.tar.gz")
md5sums=('4136d7b4c04df68b686570afa26988ac')

pkgdesc="ELF object file access library, legacy version"

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  CPP='gcc -E' ./configure --prefix=/opt/libelf --enable-compat --enable-gnu-names --enable-extended-format --enable-elf64
   make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make prefix="$pkgdir/opt/libelf" install

  #install -d -m 755 "${pkgdir}"/etc/ld.so.conf.d
  #echo "/opt/libelf/lib" > "${pkgdir}"/etc/ld.so.conf.d/${_pkgname}.conf
}
