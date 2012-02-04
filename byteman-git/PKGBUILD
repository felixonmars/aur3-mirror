# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=byteman-git
_pkgname=byteman
pkgver=20120108
pkgrel=1
pkgdesc="Inject side effects into Java programs for the purpose of tracing and testing application behaviour."
arch=(any)
url="http://www.jboss.org/byteman"
license=(LGPL)
depends=('java-environment>=6' 'bash')
makedepends=(git maven unzip)
install=${pkgname}.install
changelog=Changelog
provides=(${_pkgname})
conflicts=(${_pkgname})
options=('!emptydirs')

_gitroot=git://github.com/bytemanproject/${_pkgname}.git
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
  mvn --file "${srcdir}/${_gitname}/pom.xml" \
      --batch-mode \
      --update-snapshots \
      clean install || return 1

  msg2 "Generate scripts for /etc/profile.d..."
  cat <<EOF > "${srcdir}"/${_pkgname}.profile.d.sh
export BYTEMAN_HOME=/usr/share/java/${_pkgname}
EOF
  cat <<EOF > "${srcdir}"/${_pkgname}.profile.d.csh
export BYTEMAN_HOME=/usr/share/java/${_pkgname}
EOF
}

package() {

  msg2 "Extracting assembly to /usr/share/java/${_pkgname}..."
  install -dm755                                                                  "${pkgdir}/usr/share/java/${_pkgname}"
  unzip "${srcdir}"/${_gitname}/download/target/${_pkgname}-download-*-bin.zip -d "${pkgdir}/usr/share/java/${_pkgname}"
  mv "${pkgdir}"/usr/share/java/${_pkgname}/${_pkgname}-download-*/*              "${pkgdir}/usr/share/java/${_pkgname}/"

  msg2 "Setting permissions..."
  chmod -R 644 "${pkgdir}"/usr/share/java/${_pkgname}
  chmod 755 "${pkgdir}"/usr/share/java/${_pkgname}/bin/*
  find "${pkgdir}/usr/share/java" -type d -exec chmod 755 {} \;

  msg2 "Set up the BYTEMAN_HOME environment variable in /etc/profile.d..."
  install -Dm755 "${srcdir}"/${_pkgname}.profile.d.sh  "${pkgdir}"/etc/profile.d/${_pkgname}.sh
  install -Dm755 "${srcdir}"/${_pkgname}.profile.d.csh "${pkgdir}"/etc/profile.d/${_pkgname}.csh

  msg2 "Install links to the documentation resources at /usr/share/doc/${_pkgname}..."
  install -dm755                           "${pkgdir}/usr/share/doc/${_pkgname}"
  ln -s /usr/share/java/${_pkgname}/README "${pkgdir}/usr/share/doc/${_pkgname}/README"
  ln -s /usr/share/java/${_pkgname}/docs   "${pkgdir}/usr/share/doc/${_pkgname}/docs"
  ln -s /usr/share/java/${_pkgname}/sample "${pkgdir}/usr/share/doc/${_pkgname}/sample"

  msg2 "Install links to the executables in /usr/bin..."
  install -dm755                                     "${pkgdir}/usr/bin"
  ln -s /usr/share/java/${_pkgname}/bin/bmcheck.sh   "${pkgdir}/usr/bin/bmcheck"
  ln -s /usr/share/java/${_pkgname}/bin/bminstall.sh "${pkgdir}/usr/bin/bminstall"
  ln -s /usr/share/java/${_pkgname}/bin/bmjava.sh    "${pkgdir}/usr/bin/bmjava"
  ln -s /usr/share/java/${_pkgname}/bin/bmsubmit.sh  "${pkgdir}/usr/bin/bmsubmit"
}

# vim:set ts=2 sw=2 et:
