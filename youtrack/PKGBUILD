# Maintainer: Gauthier P. <kendos.kenlen@gmail.com>
# Contributor: onny <onny@project-insanity.org>

pkgname=youtrack
pkgver=6.0.12634
pkgrel=1
pkgdesc="Issue Tracker and Agile Project Management Tool" 
url="https://www.jetbrains.com/youtrack/index.jsp" 
license="nonfree" 
arch=(any)
_watch=('http://www.jetbrains.com/js2/version.js','versionYTLong\s=\s"([\d.]*)"')
depends=('java-runtime') 
source=("http://download-cf.jetbrains.com/charisma/${pkgname}-${pkgver}.jar")
sha512sums=('4cdd4fda0b6acbc8cb1621dce4b32e68cbb2effdd53bf5a07bd168a264e62e4ab68003710f7ac66115d8c1a1fedb22d624f14bb7fc28165900451b9f332e3880')
noextract=("${pkgname}-${pkgver}.jar")

package() { 
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cp -Lv "${srcdir}/${pkgname}-${pkgver}.jar" "${pkgdir}/opt/${pkgname}/${pkgname}.jar"
  echo -e "#!/bin/bash\njava -jar /opt/${pkgname}/${pkgname}.jar \$@" > "${pkgdir}/usr/bin/${pkgname}"
  chmod a+x "${pkgdir}/usr/bin/${pkgname}"
}
