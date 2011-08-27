# Contributor: Georges Dubus <georges.dubus@supelec.fr>
pkgname=loggerhead-bzr
pkgver=398
pkgrel=1
pkgdesc="A web viewer for projects in bazaar."
arch=('i686' 'x86_64')
url="https://launchpad.net/loggerhead"
license=('GPL2')
depends=("python-simpletal" "python-paste>=1.2")
makedepends=("python")
optdepends=("python-paste-deploy: needed when proxying through Apache")
provides=('loggerhead')
conflicts=('loggerhead')
source=()
md5sums=()

_bzrbranch=lp:loggerhead
_bzrname=loggerhead

build() {
  cd ${srcdir}
  msg "Connecting to BZR server..."

  if [ -d ${srcdir}/${_bzrname} ] ; then
    cd ${_bzrname} && bzr pull ${_bzrbranch}
    msg "Local repository updated."
  else
    bzr co ${_bzrbranch}
  fi
  #bzr branch ${_bzrbranch} -q -r ${pkgver}
  cd ${srcdir}/${_bzrname}

  msg "BZR checkout done or server timeout"

  python setup.py install --root=${pkgdir}
}
