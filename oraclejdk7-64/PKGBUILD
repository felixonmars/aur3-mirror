# Maintainer: Damian Nowak <damian.nowak@atlashost.eu>

_major='7'
_minor='72'
_build='b14'
_bit='64'
_arch='x64'
pkgname="oraclejdk${_major}-${_bit}"
pkgver="${_major}u${_minor}"
pkgrel='1'
pkgdesc="Non-conflicting ${_bit}-bit Oracle JDK ${_major} for servers"
arch=('x86_64')
url='http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html'
license=('unknown')
depends=('glibc' 'libjpeg-turbo' 'lcms2' 'nss' 'ca-certificates-java')
provides=("java-environment=${_major}" "java-runtime=${_major}" "java-runtime-headless=${_major}" "java-web-start=${_major}")
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -O -b "oraclelicense=a"')
source=("http://download.oracle.com/otn-pub/java/jdk/${pkgver}-${_build}/jdk-${pkgver}-linux-${_arch}.tar.gz")
sha512sums=('2eb48ece34db591bb0caf70caa06a165cd37ed26c7c4a421ad715962672cf0582e9c74c82c70a8ef0ad3eaf6ff7267e37e0d47e9e9be6eb35ef5fe961fc08aba')
options=(!strip)
PKGEXT=('.pkg.tar.gz')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/lib/jvm" "$pkgdir/etc/conf.d"
  mv "jdk1.7.0_${_minor}" "$pkgdir/usr/lib/jvm/$pkgname"
  echo "JAVA_HOME=\"/usr/lib/jvm/$pkgname\"" > "$pkgdir/etc/conf.d/$pkgname"
}
