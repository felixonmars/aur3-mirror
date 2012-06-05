# Maintainer: timttmy <marshall\\dot//cleave\\at//tiscali\\dot//co\\dot//uk>

pkgname='feedstail-git'
_pkgname=feedstail
pkgver=20120605
pkgrel=3
pkgdesc="Feedstail is a tail-f-like utility for rss feeds. - latest git revision"
arch=('any')
url="http://pypi.python.org/pypi/feedstail"
license=('GPL3')
depends=('python2' 'python2-feedparser')
provides=('feedstail')
optdepends=()
makedepends=('git' 'python2-distribute')



_gitroot="git://gitorious.org/feedstail/feedstail.git"

_gitname="feedstail"

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
  
  cd "$srcdir/$_gitname"
  
  msg ""

msg "Starting make..."

    python2 setup.py install --prefix=/usr --install-data=/usr/share/feedstail/ --root="$pkgdir" || return 1
    } 
