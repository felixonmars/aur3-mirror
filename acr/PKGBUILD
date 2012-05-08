# Maintainer: stalker_exe <stalkerexe8@gmail.com>
pkgname=acr
pkgver=0.8.6
pkgrel=1
pkgdesc="ACR is an autoconf like tool that allows you to create configure scripts for your programs."
arch=('any')
url="http://nopcode.org/wk.php/Acr"
license=('GPL2')
depends=()
source=("http://www.lolcathost.org/b/$pkgname-$pkgver.tar.gz")

md5sums=('0981ffbd92dcb63015793a849c34465d')

build() {
  cd "${srcdir}/$pkgname-${pkgver}"
 ./configure --prefix=/usr --mandir=/usr/share/man
}

package() {
  cd "${srcdir}/$pkgname-${pkgver}"
  make DESTDIR=${pkgdir} install
}
