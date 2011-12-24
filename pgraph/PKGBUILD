# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=pgraph
_pkgname=pGraph
pkgver=2.3
pkgrel=3
pkgdesc="Read multiple performance data formats and produce graphs either interactively or in batch mode."
arch=(any)
url="http://www.ibm.com/developerworks/wikis/display/WikiPtype/pGraph"
license=(unknown) # FIXME
depends=('java-runtime>=5' 'bash')
install=${pkgname}.install
changelog=Changelog
source=("${_pkgname}.jar::http://www.ibm.com/developerworks/wikis/download/attachments/53871809/${_pkgname}.jar?version=5"
        "${_pkgname}.properties::http://www.ibm.com/developerworks/wikis/download/attachments/53871809/${_pkgname}.properties?version=1")
noextract=(${pkgname}.jar)
md5sums=('a22000cb33e76a1652467a414ada1e5c'
         '6bbb3d137aa3c45ff1c96410dac800da')

build() {
  msg2 "Generate executable script..."
  cat > "${srcdir}/${pkgname}.sh" << EOF
#!/bin/sh
cd '/usr/share/java/${pkgname}'
"\$JAVA_HOME/bin/java" -jar '${_pkgname}.jar' "\$@"
EOF

  msg2 "Generate desktop application entry..."
  cat > "${srcdir}/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=${_pkgname}
Comment=${pkgdesc}
TryExec=${pkgname}
Exec=${pkgname} %u
Icon=java
Terminal=false
Type=Application
Categories=Application;Utility;
EOF
}

package() {
  msg2 "Install the contents at /usr/share/java/${pkgname}..."
  install -Dm755 "${srcdir}/${_pkgname}.jar"        "${pkgdir}/usr/share/java/${pkgname}/${_pkgname}.jar"
  install -Dm644 "${srcdir}/${_pkgname}.properties" "${pkgdir}/usr/share/java/${pkgname}/${_pkgname}.properties"

  msg2 "Install the default settings file at /etc/${pkgname}..."
  install -dm755 "${pkgdir}/etc"
  ln -s "/usr/share/java/${pkgname}/${_pkgname}.properties" "${pkgdir}/etc/${pkgname}.properties"

  msg2 "Install an executable at /usr/bin/${pkgname}..."
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  msg2 "Install a desktop application entry at /usr/share/applications..."
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
