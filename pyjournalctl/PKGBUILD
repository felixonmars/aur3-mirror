# Maintainer : bluephoenix47 <bluephoenix47@gmail.com>

pkgname=pyjournalctl
pkgver=20130116
pkgrel=1
pkgdesc='A python interface to journalctl'
url='https://github.com/kwirk/pyjournalctl'
license=('GLPL')
arch=('any')
makedepends=('git')
depends=('python2>=2.7' 'systemd>=187')
source=()
md5sums=()

_gitroot="git://github.com/kwirk/pyjournalctl.git"
_gitname="pyjournalctl.git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname" 
  fi

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build" 
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root $pkgdir
}

