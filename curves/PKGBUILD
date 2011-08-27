# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=curves
pkgver=0.8.19
pkgrel=2
pkgdesc="Provides a menu and command completion interface to CVS "
arch=('i686' 'x86_64')
url="http://packages.debian.org/unstable/vcs/curves"
license=('GPL')
depends=('gcc-libs')
source=(http://ftp.debian.org/debian/pool/main/c/curves/curves_0.8.19.tar.gz)
md5sums=('6e280f6d87f5620221d14484d054e715') 

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make 
}
package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make datadir=${pkgdir}/usr/share/${pkgname} bindir=${pkgdir}/usr/bin mandir=${pkgdir}/usr/share/man install
}
