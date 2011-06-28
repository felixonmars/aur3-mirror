#Contributor: Bruno Galeotti <bravox87 at gmail dot com>
pkgname=tweepy-git
pkgver=20110628
pkgrel=1
pkgdesc='Twitter api library for python edit.'
url='http://github.com/tweepy/tweepy'
license='custom'
arch=('i686' 'x86_64')
depends=()
makedepends=('git' 'setuptools')
conflicts=('tweepy' 'tweepy-git')
replaces=('tweepy' 'tweepy-git')
provides=('tweepy')
_gitroot='git://github.com/tweepy/tweepy.git'
_gitname='tweepy'
source=()
md5sums=()

build() {
  cd ${srcdir}

  msg "Connecting to GIT server...."

  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull --rebase
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"

  if [ -d $_gitname-build ]; then
    msg 'Removing old build directory'
    rm -rf $_gitname-build
  fi

  msg 'Copying repository to another build directory'
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build

  msg "Starting build"
  cd $srcdir/$_gitname-build

  msg 'Running setup.py'
  python2 setup.py build || return 1
  python2 setup.py install --root=$pkgdir || return 1
}
