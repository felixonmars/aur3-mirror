# Maintainer: Erik Johnson <palehose at gmail dot com>
pkgname=f-git
pkgver=20111208
pkgrel=1
pkgdesc="Quick access to recent files"
arch=('any')
url="https://github.com/clvv/f"
license=('GPL')
conflicts=('f')
provides=('f')
source=(f.install)
install='f.install'
md5sums=('dd124cda0de1d478a7dca9e0d2cffe2c')

_gitroot="https://github.com/clvv/f.git"
_gitname="f"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
    cd ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  mkdir -p -m 0755 ${pkgdir}/usr/lib
  install -m 0755 ${srcdir}/${_gitname}/f.sh ${pkgdir}/usr/lib/
}
