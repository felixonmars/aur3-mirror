# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-etsproxy-git
pkgver=20110623
pkgrel=1
pkgdesc="ETS Proxy Modules for Backwards Compatibility"
arch=('i686' 'x86_64')
url="https://github.com/enthought/etsproxy"
license=('BSD')
depends=('python2')
makedepends=('git' 'python2-distribute')
conflicts=('python2-etsproxy'
           'python2-enthoughtbase' 'python2-envisagecore' 'python2-envisageplugins'
           'python2-traitsbackendwx' 'python2-traitsbackendqt' 'python2-traitsgui')
provides=('python2-etsproxy'
          'python2-enthoughtbase' 'python2-envisagecore' 'python2-envisageplugins'
          'python2-traitsbackendwx' 'python2-traitsbackendqt' 'python2-traitsgui'
          'python2-enthoughtbase-git' 'python2-envisagecore-git' 'python2-envisageplugins-git'
          'python2-traitsbackendwx-git' 'python2-traitsbackendqt-git' 'python2-traitsgui-git')
options=(!emptydirs)

_gitroot="https://github.com/enthought/etsproxy.git"
_gitname="etsproxy"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python2 setup.py install --root="$pkgdir"/ --optimize=1
}

