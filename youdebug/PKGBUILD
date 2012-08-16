# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=youdebug
pkgver=1.4
pkgrel=1
pkgdesc="A Java non-interactive debugger scripted by Groovy."
arch=(any)
url="http://youdebug.kohsuke.org"
license=(MIT)
depends=(java-environment bash)
changelog=Changelog
source=("${pkgname}.jar::http://search.maven.org/remotecontent?filepath=org/kohsuke/${pkgname}/${pkgver}/${pkgname}-${pkgver}-jar-with-dependencies.jar")
noextract=(${pkgname}.jar)
md5sums=('2edd92b99e9b89f3b81834ee0cc12a3f')

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
