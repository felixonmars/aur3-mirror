# Maintainer: Tim Reddehase <robustus@rightsrestricted.com>

pkgname=pellet
pkgver=2.3.1
pkgrel=2

pkgdesc="A parsing, static analysis and proof management tool incorporating various provers and different specification languages, thus providing a tool for heterogeneous specifications. Logic translations are first-class citizens."

url=('http://clarkparsia.com/pellet')
arch=('i686' 'x86_64')
license='custom:hets-license'
depends=('java-environment=7' 'apache-ant')
provides=('pellet')
conflicts=('pellet')
sha1sums=(7d46c04fdae8d8a15af07521c4cb033fd39385eb)

source=('https://github.com/clarkparsia/pellet/archive/2.3.1.tar.gz')
package() {
  cd ${srcdir}/$pkgname-$pkgver

  JAVA_TOOL_OPTIONS=-Dfile.encoding=ISO8859_1 ant

  mkdir -p ${pkgdir}/{usr/bin,opt}

  cp -r dist/ ${pkgdir}/opt/${pkgname}

  echo '#!/bin/sh
if [ -n "${JAVA_HOME}" -a -x "${JAVA_HOME}/bin/java" ]; then
  java="${JAVA_HOME}/bin/java"
else
  java=java
fi

if [ -z "${pellet_java_args}" ]; then
  pellet_java_args="-Xmx512m"
fi

exec ${java} ${pellet_java_args} -jar /opt/pellet/lib/pellet-cli.jar "$@"
  ' >> ${pkgdir}/usr/bin/pellet

  chmod +x ${pkgdir}/usr/bin/pellet
}
