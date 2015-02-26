# Maintainer: rNoz <rnoz.commits@gmail.com>
pkgname=ssh-config
pkgver=0.1.3r
pkgrel=1
pkgdesc="A Tool for Managing ssh Config Files (rNoz forked version 0.1.3r)"
arch=('i686' 'x86_64')
# Original: https://github.com/dbrady/ssh-config
url="https://github.com/rNoz/ssh-config"
license=('MIT')
depends=(ruby)
makedepends=(git)

_gitroot='https://github.com/rNoz/ssh-config.git'
_pkgvername="${pkgname}-${pkgver}"

prepare() {
  [ -e "${srcdir}/${_pkgvername}" ] && rm -rf "${srcdir}/${_pkgvername}"
  cd "${srcdir}"
  msg "Connecting to GIT server...."
  git clone "${_gitroot}" "${_pkgvername}"
  msg "GIT checkout done or server timeout"
}

package() {
  cd "${srcdir}/${_pkgvername}"
  mkdir -p "${pkgdir}"/usr/{bin,lib}
  cp lib/* "${pkgdir}"/usr/lib/
  cp bin/* "${pkgdir}"/usr/bin/
  chmod 755 "${pkgdir}"/usr/bin/*
}
