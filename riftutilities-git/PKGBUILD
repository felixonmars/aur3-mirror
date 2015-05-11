# Maintainer: Zachary Jaggi <feilen1000@gmail.com>

pkgver=.r0.7e68733
pkgrel=1
_basename='riftutilities'
pkgname=${_basename}-git
pkgdesc='A collection of scripts to allow easier use of the Oculus Rift on Linux. (xrandrift)'
arch=('any')
url='https://github.com/feilen/riftutilities.git'
license=('MIT')
depends=('xorg-xrandr')
optdepends=('oculus-udev: Rules to let users access the Oculus Rift')
source=("${_basename}::git+https://github.com/feilen/${_basename}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_basename}

  printf "%s.r%s.%s" "${_oculusver}" "$(git rev-list --count ${_tag}..HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${_basename}

  install -dm 755 ${pkgdir}/usr/bin
  install -m 755 xrandrift ${pkgdir}/usr/bin/xrandrift
}
