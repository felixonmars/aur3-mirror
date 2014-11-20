# Maintainer: zezadas jmrm@ua.pt
pkgname=equivs
pkgver=2.0.9
pkgrel=1
pkgdesc="Circumvent Debian package dependencies"
arch=(any)
url="https://packages.debian.org/ca/source/wheezy/equivs"
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/e/equivs/${pkgname}_${pkgver}.tar.gz")
sha256sums=('SKIP') #autofill using updpkgsums

build() {
  cd "e"

  #./configure --prefix=/usr
  #make
}

package() {
  #pwd
  cp -r ${srcdir}/e/usr ${pkgdir}
  
}