# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=gcviewer
pkgver=1.29
pkgrel=1
pkgdesc="Java garbage collector logs analyzer/visualizer."
arch=(any)
url="http://www.tagtraum.com/gcviewer.html"
license=(LGPL)
depends=('java-runtime>=5')
changelog=Changelog
source=("http://www.tagtraum.com/download/${pkgname}-${pkgver}-bin.tar.gz")
md5sums=('39ef34732308252caed97c7482b46f4f')

build() {
  msg2 "Generate executable script..."
  cat > "${srcdir}/${pkgname}.sh" << EOF
#!/bin/sh
"\$JAVA_HOME/bin/java" -jar '/usr/share/java/${pkgname}/${pkgname}.jar' "\$@"
EOF
}

package() {
  msg2 "Install the library at /usr/share/java/${pkgname}..."
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

  msg2 "Install documentation resources at /usr/share/doc/${pkgname}..."
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.txt" "${pkgdir}/usr/share/doc/${pkgname}/README.txt"

  msg2 "Install license resources at /usr/share/licenses/${pkgname}..."
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  msg2 "Install an executable at /usr/bin/${pkgname}..."
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
