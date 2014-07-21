# Maintainer: Daniel Kozak <kozzi11@gmail.com>

pkgname=nuget-cert
pkgver=1
pkgrel=2
pkgdesc="Certificates for NuGet" 
arch=('i686' 'x86_64')
url="http://stackoverflow.com/a/16589218"
license=('custom')
depends=('mono>=3.4')
makedepends=()
options=()
source=('certs.tar.gz')
provides=('nuget-cert')
conflicts=('nuget-cert')
md5sums=('aadc679707223a8b39675a6dd29bdde7')


#build() {}

package() {
  
  cd ${srcdir}
  mkdir -p $pkgdir/usr/share/.mono  
  cp -Raf {certs,keypairs} $pkgdir/usr/share/.mono/
}

