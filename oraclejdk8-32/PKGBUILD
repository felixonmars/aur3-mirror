# Maintainer: Damian Nowak <damian.nowak@atlashost.eu>

_major='8'
_minor='25'
_build='b17'
_bit='32'
_arch='i586'
pkgname="oraclejdk${_major}-${_bit}"
pkgver="${_major}u${_minor}"
pkgrel='1'
pkgdesc="Non-conflicting ${_bit}-bit Oracle JDK ${_major} for servers"
arch=('i686' 'x86_64')
url='http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html'
license=('unknown')
depends=('lib32-glibc' 'lib32-libxslt' 'ca-certificates-java')
[ "$CARCH" == 'i686' ] && depends=('libxslt' 'ca-certificates-java')
provides=("java-environment=${_major}" "java-runtime=${_major}" "java-runtime-headless=${_major}" "java-web-start=${_major}")
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -O -b "oraclelicense=a"')
source=("http://download.oracle.com/otn-pub/java/jdk/${pkgver}-${_build}/jdk-${pkgver}-linux-${_arch}.tar.gz")
sha512sums=('3579d9373ce73f41c436a054e6f4f0c2a4b3aaebe09c53285550d09d3614c48c1a5520f0bee2f2ba128dd66f1e86dcd64ae6191394e7c4c4d8a999dfc0e0dc02')
options=(!strip)
PKGEXT=('.pkg.tar.gz')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/lib/jvm" "$pkgdir/etc/conf.d"
  minor0=`printf "%02d" "${_minor}"`
  mv "jdk1.${_major}.0_${minor0}" "$pkgdir/usr/lib/jvm/$pkgname"
  echo "JAVA_HOME=\"/usr/lib/jvm/$pkgname\"" > "$pkgdir/etc/conf.d/$pkgname"
}

