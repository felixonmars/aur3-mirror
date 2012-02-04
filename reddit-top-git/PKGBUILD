# Maintainer: Nicolas Paris <nicolas.caen@gmail.com>
pkgname=reddit-top-git
pkgver=20110707
pkgrel=1
pkgdesc="It's a top-like program for monitoring stories on reddit from the console (fork from pkrumins)"
arch=('any')
url="https://github.com/Nic0/reddit-top"
license=('GPL')
depends=('python2-distribute' 'python-beautifulsoup')
makedepends=('git')

_gitroot="git://github.com/Nic0/reddit-top.git"
_gitname="reddit-top"

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

  python2 setup.py build

}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
} 

