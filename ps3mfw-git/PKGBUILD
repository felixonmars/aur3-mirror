# Maintainer: dryes <joswiseman@gmail>
pkgname='ps3mfw-git'
pkgver=20120107
pkgrel=1
pkgdesc='Easy to use set of API functions that facilitate the modification of firmware for PlayStation 3 computer systems.'
url='http://ps3mfw.com/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('tcl' 'tk' 'fail0verflow-ps3tools-git')
makedepends=('git')
provides=('ps3mfw')

_gitroot='git://github.com/DanyL/PS3MFW-Builder.git'
_gitname='ps3mfw'

build() {
  cd "${srcdir}"
  msg 'Connecting to GIT server....'

  if [ -d "${_gitname}" ] ; then
    cd "${_gitname}" && git pull origin
    msg 'The local files are updated.'
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg 'GIT checkout done or server timeout'
}

package() {
  mkdir -p "${pkgdir}/"{opt,usr/bin}
  cp -r "${srcdir}/${_gitname}" "${pkgdir}/opt/ps3mfw"
  rm -rf "${pkgdir}/opt/ps3mfw/.git"

  sed -i -r 's/(set (PUP((UN)?PACK)?|(COS)?(UN)?PKG|(UN|MAKE)SELF) \")/\1f0f-/gi' "${pkgdir}/opt/ps3mfw/ps3mfw"

  echo -e "#!/bin/bash\n\ntclsh /opt/ps3mfw/AppMain.tcl \${@}" >> "${pkgdir}/usr/bin/ps3mfw"
  chmod +x "${pkgdir}/usr/bin/ps3mfw"
}
