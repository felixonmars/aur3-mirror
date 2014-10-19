# Maintainer: Damian Nowak <damian.nowak@atlashost.eu>

_major='8'
_minor='25'
_build='b17'
_bit='64'
_arch='x64'
pkgname="oraclejdk${_major}-${_bit}"
pkgver="${_major}u${_minor}"
pkgrel='1'
pkgdesc="Non-conflicting ${_bit}-bit Oracle JDK ${_major} for servers"
arch=('x86_64')
url='http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html'
license=('unknown')
depends=('libxslt' 'ca-certificates-java')
provides=("java-environment=${_major}" "java-runtime=${_major}" "java-runtime-headless=${_major}" "java-web-start=${_major}")
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -O -b "oraclelicense=a"')
source=("http://download.oracle.com/otn-pub/java/jdk/${pkgver}-${_build}/jdk-${pkgver}-linux-${_arch}.tar.gz")
sha512sums=('293f3f28e0f46dc15a2380016f7a3cb64f5cd7ffca191c648644fd396690ef82b034a74273e1de4bc0d2260695fa13a0785872084dd00e30ede831206931667b')
options=(!strip)
PKGEXT=('.pkg.tar.gz')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/lib/jvm" "$pkgdir/etc/conf.d"
  minor0=`printf "%02d" "${_minor}"`
  mv "jdk1.${_major}.0_${minor0}" "$pkgdir/usr/lib/jvm/$pkgname"
  echo "JAVA_HOME=\"/usr/lib/jvm/$pkgname\"" > "$pkgdir/etc/conf.d/$pkgname"
}
