# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=jdk-docs-devel
_major=8
_build=b132
_date=05_mar_2014
pkgver=${_major}${_build}
pkgrel=1
pkgdesc="Java SE Development Kit Documentation Snapshot"
arch=("any")
url="http://www.oracle.com/technetwork/java/index.html"
license=("custom")
options=("docs" "!strip")
provides=('jdk-docs')
conflicts=('jdk-docs')
_arch="x64"
if [ "${CARCH}" = "i686" ]; then
  _arch="i586"
  md5sums[0]="c45b75568baa8c39bba63778446c7334"
fi
source=("http://www.java.net/download/jdk8/archive/${_build}/binaries/jdk-8-fcs-docs-${_build}-all-${_date}.zip"
        'LICENSE')
md5sums=('8e1e8bf073e5406c2fd41b075e84ed45'
         '5ee4bb1a01409d717e5febb9908d1abb')

package() {
  cd docs
  install -d "$pkgdir/usr/share/doc/java"
  cp -rf * "$pkgdir/usr/share/doc/java"
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
