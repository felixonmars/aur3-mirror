# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=mbeancmd
pkgver=2.3.2
pkgrel=1
pkgdesc="A command-line tool written in Java for interacting with MBeans on any J2EE server."
arch=(any)
url="http://wiki.jasmine.ow2.org/xwiki/bin/view/Documentation/MBeanCmd"
license=(LGPL)
depends=(java-runtime bash)
changelog=Changelog
source=("${pkgname}.jar::http://search.maven.org/remotecontent?filepath=org/ow2/jasmine/${pkgname}-assemblies-core/${pkgver}/${pkgname}-assemblies-core-${pkgver}-bin.jar")
noextract=(${pkgname}.jar)
md5sums=('fc68609cb0f133287359df7a2d6b5e16')

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
