# Maintainer: Damian Nowak <damian.nowak@atlashost.eu>

_major='6'
_minor='45'
_build='b06'
_bit='64'
_arch='x64'
pkgname="oraclejdk${_major}-${_bit}"
pkgver="${_major}u${_minor}"
pkgrel='1'
pkgdesc="Non-conflicting ${_bit}-bit Oracle JDK ${_major} for servers"
arch=('x86_64')
url='http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase6-419409.html'
license=('unknown')
depends=('glibc' 'libjpeg-turbo' 'lcms2' 'nss' 'ca-certificates-java')
provides=("java-environment=${_major}" "java-runtime=${_major}" "java-runtime-headless=${_major}" "java-web-start=${_major}")
source=("http://ghaffarian.net/downloads/Java/JDK/jdk-${pkgver}-linux-${_arch}.bin")
sha512sums=('bf2fcb8696b9e43af80d9114fd984d86317422e8c65dd464a7abff4017a5c4c0d8ebdbd8418270fc8c6c52c2b97498f02742440ed4f8394b3612d2e2186c30d8')
options=(!strip)
PKGEXT=('.pkg.tar.gz')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/lib/jvm" "$pkgdir/etc/conf.d"

  zip="jdk-$pkgver-linux-${_arch}.bin"
  chmod +x "$zip"
  
  (
    pid="$BASHPID"
    yes | "./$zip" 2> /dev/null | while read line; do
      [[ "$line" == 'Press Enter to continue.....' ]] && kill -9 $pid
    done
  ) || echo

  mv "jdk1.6.0_${_minor}" "$pkgdir/usr/lib/jvm/$pkgname"
  echo "JAVA_HOME=\"/usr/lib/jvm/$pkgname\"" > "$pkgdir/etc/conf.d/$pkgname"
}
