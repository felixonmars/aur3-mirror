# Maintainer: Fabian Schuh <mail@xeroc.org>
pkgname=python-trezor-git
pkgver=`date +%G%m%d`
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/trezor"
license=('unkown')
makedepends=('python' 'git')

optdepends=()
provides=()
conflicts=()
source=()
md5sums=()

_gitroot="https://github.com/trezor/python-trezor.git"
_gitname="python-trezor"

package() {
  cd ${srcdir}/

  msg "Connecting to the GIT server...."
  if [[ -d ${srcdir}/${_gitname} ]] ; then
    cd ${_gitname}
    git pull origin
    msg "The local files are updated..."
  else
    git clone ${_gitroot}
    cd ${_gitname}
  fi
  msg "GIT checkout done."

  msg "Starting setup.py for: ${pkgname}"
  python setup.py install --root="$pkgdir/"

  install -Dm644 "$srcdir/${_gitname}/cmd.py" "$pkgdir/usr/bin/pytrezor"
}
