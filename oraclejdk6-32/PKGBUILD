# Maintainer: Damian Nowak <damian.nowak@atlashost.eu>

_major='6'
_minor='45'
_build='b06'
_bit='32'
_arch='i586'
pkgname="oraclejdk${_major}-${_bit}"
pkgver="${_major}u${_minor}"
pkgrel='1'
pkgdesc="Non-conflicting ${_bit}-bit Oracle JDK ${_major} for servers"
arch=('i686' 'x86_64')
url='http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase6-419409.html'
license=('unknown')
depends=('lib32-glibc' 'lib32-libjpeg-turbo' 'lcms2' 'lib32-nss' 'ca-certificates-java')
# TODO: Add dependency on lib32-lcms2 once they add it to repo. https://bugs.archlinux.org/task/32994
[ "$CARCH" == 'i686' ] && depends=('libjpeg-turbo' 'lcms2' 'nss' 'ca-certificates-java')
provides=("java-environment=${_major}" "java-runtime=${_major}" "java-runtime-headless=${_major}" "java-web-start=${_major}")
source=("http://ghaffarian.net/downloads/Java/JDK/jdk-${pkgver}-linux-${_arch}.bin")
sha512sums=('9539da9779c0a74165da24bd5730b8b7e58f4b8a38841de04919af8a957fa83f32367fdcb393d4ac756feccaf0cf014ebf2f74180f9301d22944fa30dfb87777')
options=(!strip)
PKGEXT=('.pkg.tar.gz')
echo $source

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
