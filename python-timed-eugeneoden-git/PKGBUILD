# Maintainer: Tom Vincent <http://www.tlvince.com/contact/>

pkgname=python-timed-eugeneoden-git
pkgver=20101120
pkgrel=2
pkgdesc="Command-line time tracking tool, eugeneoden's maintained fork"
arch=('i686' 'x86_64' 'ppa')
url="http://github.com/eugeneoden/timed"
license=('BSD')
depends=('python2' 'setuptools' 'python-dateutil')
makedepends=('git')
provides=(python-timed)
conflicts=(python-timed-git)

_gitroot="git://github.com/eugeneoden/timed.git"
_gitname="timed"

build() {
  msg "Connecting to GIT server...."

  if [[ -d $startdir/src/$_gitname ]] ; then
    cd $_gitname
    git pull origin || return 1
    msg "The local files are updated."
  else
    git clone $_gitroot || return 1
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd $startdir/src/$_gitname
  python2 setup.py build || return 1
  python2 setup.py install --prefix=/usr --root=$startdir/pkg
}
