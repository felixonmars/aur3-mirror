# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=devtodo2-git
pkgver=1
pkgrel=1
pkgdesc='A console-based, per-folder, simple, and flexible todo list'
arch=('i686' 'x86_64')
url='http://swapoff.org/devtodo.html'
license=('GPL')
depends=()
makedepends=(git go-goopt)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
noextract=()
_vcsroot='git://github.com/alecthomas/devtodo2.git'
_vcsname='devtodo2'

build(){
  cd "$srcdir"
  msg2 "Connecting to GIT server...."

  if [ -d ${_vcsname}/.git ] ; then
    cd $_vcsname
    git pull --depth 1 origin
    msg2 "The local files are updated."
  else
    git clone --depth 1 $_vcsroot $_vcsname
    cd $_vcsname
  fi

  msg2 "GIT checkout done or server timeout"
  msg2 "Starting make"

#  ./configure --prefix=/usr
#  make
}
package(){
  cd "$srcdir"/$_vcsname

  install -dm755 "$pkgdir"/usr/{bin,share/man/man1}
  make PREFIX="$pkgdir/usr" install
}
