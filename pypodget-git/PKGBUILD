#Maintainer: "Yannick LM <yannicklm1337 AT gmail DOT com>"

pkgname=pypodget-git
pkgver=20121106
pkgrel=1
pkgdesc="A rewrite of podget in python"
url="https://github.com/yannicklm/pypodget"
arch=('any')
license=('BSD')
depends=('python-feedparser')
optdepends=('python-progressbar: for --verbose option')
makedepends=('git' 'python')

_gitroot="git://github.com/yannicklm/pypodget.git"
_gitname="pypodget"

build() {
  cd ${srcdir}
  msg "Connecting to git server...."

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  git clone $_gitname $_gitname-build
  cd ${srcdir}/$_gitname-build
  python setup.py install --root=$pkgdir || return 1
  install -D -m 644 COPYING ${pkgdir}/usr/share/licences/pypodget/COPYING
}
