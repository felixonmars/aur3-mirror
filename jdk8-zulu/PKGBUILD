# Maintainer: Blazej Bucko <blazej.bucko@gmail.com
_java_major=8
_java_ver=1.8.0
_upd_ver=40
_zulu_ver=8.6.0.1
_build_date=2015-03-8.6
_jvmdir=/usr/lib/jvm/java-8-zulu
_jname=jdk8

pkgname=jdk${_java_major}-zulu
pkgrel=1
pkgver=${_java_ver}_u${_upd_ver}.${_zulu_ver}
pkgdesc="Zulu is a certified build of OpenJDK that is fully compliant with the Java SE standard"
arch=('x86_64')
url="http://www.azulsystems.com/products/zulu"
license=('CUSTOM')
depends=('java-environment-common' 'java-runtime-common')
provides=("java-runtime=${_java_major}" "java-runtime-zulu=${_java_major}" "java-environment=${_java_major}")
makedepends=('pacman>=4.2.0')

DLAGENTS=('http::/usr/bin/curl --referer http://www.azulsystems.com/products/zulu/downloads -O')

source=("http://cdn.azulsystems.com/zulu/${_build_date}-bin/zulu${_java_ver}_${_upd_ver}-${_zulu_ver}-x86lx64.zip")
md5sums=('fe83a01f250db02a759ad9dca27a7f0c')

package(){
  cd "$srcdir/zulu${_java_ver}_${_upd_ver}-${_zulu_ver}-x86lx64"

  msg2 "Creating directory structure..."
  install -d "$pkgdir"/usr/share/licenses/java${_java_major}-zulu
  install -d "$pkgdir${_jvmdir}"

  msg2 "Moving LICENSE"
  mv jre/LICENSE "$pkgdir"/usr/share/licenses/java${_java_major}-zulu/

  msg2 "Moving man files"
  mv man/ja_JP.UTF-8/ man/ja
  mv man/ "$pkgdir"/usr/share

  msg2 "Installing package"
  cp -a . "$pkgdir"$_jvmdir
}
