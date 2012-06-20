# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=gatling-stress-tool-git # Name collision with https://aur.archlinux.org/packages.php?ID=7159
_pkgname=gatling
pkgver=20120620
pkgrel=1
pkgdesc="An optimized stress test tool."
arch=(any)
url="http://gatling-tool.org"
license=(APACHE)
depends=('java-environment>=6' 'bash' 'desktop-file-utils')
makedepends=(git maven)
install=${_pkgname}.install
changelog=Changelog
backup=(opt/${_pkgname}/conf/gatling.conf
        opt/${_pkgname}/conf/logback.xml)
provides=(gatling-stress-tool)
conflicts=(gatling-stress-tool)

_gitroot=git://github.com/excilys/gatling.git
_gitname=${_pkgname}

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
  mvn --batch-mode \
      --update-snapshots \
      clean install || return 1

  msg2 "Generate scripts for /etc/profile.d..."
  cat <<EOF > "${srcdir}"/${_pkgname}.profile.d.sh
export GATLING_HOME=/opt/${_pkgname}
EOF
  cat <<EOF > "${srcdir}"/${_pkgname}.profile.d.csh
setenv GATLING_HOME "/opt/${_pkgname}"
EOF

  msg2 "Generate desktop application entry for recorder..."
  cat > "${srcdir}/recorder.desktop" << EOF
[Desktop Entry]
Name=Gatling recorder
Comment=${pkgdesc}
TryExec=${_pkgname}-recorder
Exec=${_pkgname}-recorder %u
Icon=/opt/gatling/assets/style/logo.png
Terminal=false
Type=Application
Categories=Application;Utility;
EOF
}

package() {
  msg2 "Unpacking assembly..."
  cd "${srcdir}"
  tar xvzf "${srcdir}"/${_gitname}/gatling-bundle/target/gatling-bundle-*-SNAPSHOT-bundle.tar.gz

  msg2 "Install the assembly at /opt/${_pkgname}..."
  install -dm755                                "${pkgdir}/opt/${_pkgname}"
  cp -a "${srcdir}"/gatling-bundle-*-SNAPSHOT/* "${pkgdir}/opt/${_pkgname}"

  msg2 "Set up the GATLING_HOME environment variable in /etc/profile.d..."
  install -Dm755 "${srcdir}/${_pkgname}.profile.d.sh"  "${pkgdir}/etc/profile.d/${_pkgname}.sh"
  install -Dm755 "${srcdir}/${_pkgname}.profile.d.csh" "${pkgdir}/etc/profile.d/${_pkgname}.csh"

  msg2 "Install links to documentation resources at /usr/share/doc/${_pkgname}..."
  install -dm755                    "${pkgdir}/usr/share/doc/${_pkgname}"
  ln -s /opt/${_pkgname}/user-files "${pkgdir}/usr/share/doc/${_pkgname}/"

  msg2 "Install links to configuration files at /etc/${_pkgname}..."
  install -dm755                               "${pkgdir}/etc/${_pkgname}"
  ln -s /opt/${_pkgname}/conf/${_pkgname}.conf "${pkgdir}/etc/${_pkgname}/${_pkgname}.conf"
  ln -s /opt/${_pkgname}/conf/logback.xml      "${pkgdir}/etc/${_pkgname}/logback.xml"

  msg2 "Install links to executables in /usr/bin..."
  install -dm755                            "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/bin/${_pkgname}.sh "${pkgdir}/usr/bin/${_pkgname}"
  ln -s /opt/${_pkgname}/bin/recorder.sh    "${pkgdir}/usr/bin/${_pkgname}-recorder"

  msg2 "Install a desktop application entry for the recorder at /usr/share/applications..."
  install -Dm644 "${srcdir}/recorder.desktop" "${pkgdir}/usr/share/applications/${_pkgname} recorder.desktop"

  msg2 "Fix some permissions..."
  find "${pkgdir}/opt/${_pkgname}" -type d -exec chmod 755 {} \;
  find "${pkgdir}/opt/${_pkgname}" -name "*.jar" -type f -exec chmod 644 {} \;
}

# vim:set ts=2 sw=2 et:
