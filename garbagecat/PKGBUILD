# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=garbagecat
pkgver=1.0.1
pkgrel=1
pkgdesc="Java garbage collection log analyzer."
arch=(any)
url="http://code.google.com/a/eclipselabs.org/p/garbagecat/"
license=(EPL)
depends=(java-runtime bash)
changelog=Changelog
source=("${pkgname}.jar::http://${pkgname}.eclipselabs.org.codespot.com/files/${pkgname}-${pkgver}.jar")
noextract=(${pkgname}.jar)
md5sums=('e15878dcf62ba82b7315fa0b6bf1be21')

build() {
  msg2 "Generate executable script..."
  cat > "${srcdir}/${pkgname}.sh" << EOF
#!/bin/sh
cd '/usr/share/java/${pkgname}'
"\$JAVA_HOME/bin/java" -jar '/usr/share/java/${pkgname}/${pkgname}.jar' "\$@"
EOF
}

package() {
  msg2 "Install the library at /usr/share/java/${pkgname}..."
  install -Dm644 "${srcdir}/${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

  msg2 "Install an executable at /usr/bin/${pkgname}..."
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
