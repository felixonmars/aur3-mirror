# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=karun-git
_pkgname=karun
pkgver=20130127
pkgrel=1
pkgdesc="A Java graphical Pacman frontend."
arch=(any)
url="https://github.com/bahmanm/Karun"
license=('GPL2')
depends=('bash' 'java-runtime' 'java-commons-io' 'java-commons-lang' 'java-commons-compress' 'desktop-file-utils')
makedepends=('git' 'apache-ant')
install=${_pkgname}.install
changelog=Changelog
provides=(${_pkgname})
conflicts=(${_pkgname})

_gitroot=git://github.com/bahmanm/Karun.git
_gitname=Karun

build() {

  msg2 "Connecting to GIT server...."
  if [ -d "${srcdir}/${_gitname}" ] ; then
    ( cd "${srcdir}/${_gitname}" && git pull origin )
    msg2 "The local files are updated."
  else
    git clone $_gitroot "${srcdir}/${_gitname}"
  fi

  msg2 "Building..."
  cd "${srcdir}/${_gitname}"
  ant || return 1
  
  msg2 "Generate desktop application entry..."
  cat > "${srcdir}"/${_pkgname}.desktop << EOF
[Desktop Entry]
Name=${_gitname}
Version=${pkgver}
Comment=${pkgdesc}
Exec=/usr/bin/${_pkgname}
Terminal=false
Icon=applications-system
Type=Application
Categories=Settings;
EOF

  msg2 "Generate launcher script..."
  cat <<EOF > "${srcdir}"/${_pkgname}.sh
#!/bin/sh
"\$JAVA_HOME/bin/java" \\
  -cp /usr/share/java/commons-io/commons-io.jar:/usr/share/java/commons-lang/commons-lang.jar:/usr/share/java/commons-compress/commons-compress.jar:/usr/share/java/${_pkgname}/${_pkgname}.jar \\
  com.bahmanm.karun.Karun \\
  "\$@"
EOF

}

package() {

  msg2 "Install library at /usr/share/java/${_pkgname}..."
  install -Dm644 "${srcdir}"/${_gitname}/dist/${_gitname}.jar "${pkgdir}"/usr/share/java/${_pkgname}/${_pkgname}.jar

  msg2 "Install desktop application entry..."
  install -Dm644 "${srcdir}"/${_pkgname}.desktop "${pkgdir}"/usr/share/applications/${_pkgname}.desktop

  msg2 "Install an executable at /usr/bin/${_pkgname}..."
  install -Dm755 "${srcdir}"/${_pkgname}.sh "${pkgdir}"/usr/bin/${_pkgname}

}

# vim:set ts=2 sw=2 et:
