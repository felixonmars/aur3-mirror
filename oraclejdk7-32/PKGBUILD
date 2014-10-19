# Maintainer: Damian Nowak <damian.nowak@atlashost.eu>

_major='7'
_minor='72'
_build='b14'
_bit='32'
_arch='i586'
pkgname="oraclejdk${_major}-${_bit}"
pkgver="${_major}u${_minor}"
pkgrel='1'
pkgdesc="Non-conflicting ${_bit}-bit Oracle JDK ${_major} for servers"
arch=('i686' 'x86_64')
url='http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html'
license=('unknown')
depends=('lib32-glibc' 'lib32-libjpeg-turbo' 'lcms2' 'lib32-nss' 'ca-certificates-java')
# TODO: Add dependency on lib32-lcms2 once they add it to repo. https://bugs.archlinux.org/task/32994
[ "$CARCH" == 'i686' ] && depends=('libjpeg-turbo' 'lcms2' 'nss' 'ca-certificates-java')
provides=("java-environment=${_major}" "java-runtime=${_major}" "java-runtime-headless=${_major}" "java-web-start=${_major}")
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -O -b "oraclelicense=a"')
source=("http://download.oracle.com/otn-pub/java/jdk/${pkgver}-${_build}/jdk-${pkgver}-linux-${_arch}.tar.gz")
sha512sums=('eb20699405fb2d763c6b492bd2b7768e7949c35f77789ba14388aec34cb8f0886bb5375fdbbd4421e97d9528975a84c096ec348d5d7d47a3fd548c82d56410fe')
options=(!strip)
PKGEXT=('.pkg.tar.gz')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/lib/jvm" "$pkgdir/etc/conf.d"
  mv "jdk1.7.0_${_minor}" "$pkgdir/usr/lib/jvm/$pkgname"
  echo "JAVA_HOME=\"/usr/lib/jvm/$pkgname\"" > "$pkgdir/etc/conf.d/$pkgname"
}

