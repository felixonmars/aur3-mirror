# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=besm6-svn
_pkgname=besm6
pkgver=337
pkgrel=1
pkgdesc="Software emulator of the Soviet mainframe BESM-6"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/besm6/"
license=('GPL' 'MIT')
depends=('perl')
makedepends=('subversion')

_svntrunk="https://${_pkgname}.svn.sourceforge.net/svnroot/${_pkgname}"
_svnmod="${_pkgname}"

build() {
  cd "${srcdir}"

  # Download sources from SVN
  msg "Connecting to SVN server...."

  if [[ -d "${_svnmod}/.svn" ]]; then
    (cd "${_svnmod}" && svn up -r "${pkgver}")
  else
    svn co "${_svntrunk}" --config-dir ./ -r "${pkgver}" "${_svnmod}"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_svnmod}-build"
  cp -r "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

  # Fix paths to libraries
  sed -i "s/so.5/so/" simh/sim_readline.c

  # Autoconf and automake
  aclocal || return 1
  autoconf || return 1
  automake || return 1

  # Compile (without SDL support)
  sed -i "s/lSDL_ttf//" configure
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${_svnmod}-build"

  # Install program files
  make prefix="${pkgdir}/usr" install || return 1
  install -m644 disks/sbor2048.bin "${pkgdir}/usr/share/${_pkgname}"
  install -Dm755 simh/formatdisk "${pkgdir}/usr/bin/formatdisk"

  # Install data files
  mkdir -p "${pkgdir}/usr/share/${_pkgname}"/{examples,simh}
  install -m644 examples/*.{b6,txt} "${pkgdir}/usr/share/${_pkgname}/examples"
  install -m644 simh/*.{b6,bin,expect,ini,txt} "${pkgdir}/usr/share/${_pkgname}/simh"

  # Install docs
  mkdir -p "${pkgdir}/usr/share/doc/${_pkgname}"
  install -m644 AUTHORS NEWS README ChangeLog "${pkgdir}/usr/share/doc/${_pkgname}"
  sed -n "3,24p" simh/sim_defs.h > LICENSE_SIMH
  install -Dm644 LICENSE_SIMH "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE_SIMH"
}
