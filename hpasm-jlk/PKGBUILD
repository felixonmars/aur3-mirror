# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=hpasm-jlk
pkgver=7.1.0.8
pkgrel=1
pkgdesc="HP proliant drivers"
arch=('i686' 'x86_64')
url="ftp://ftp.compaq.com/pub/products/servers/supportsoftware/linux/"
license=('custom')
makedepends=('rpmextract')
source=(ftp://ftp.compaq.com/pub/products/servers/supportsoftware/linux/hpasm-jlk-7.1.0-8.linux.i386.rpm)
md5sums=('274623d980a59b25d2306fc0a48537af')

build() {
  cd "$srcdir"
  rpmextract.sh *.rpm
  cp -r ${srcdir}/opt ${pkgdir}/
}
