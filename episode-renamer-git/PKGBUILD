# Maintainer: soeren <nonick@posteo.de>

pkgname=episode-renamer-git
pkgver=0.4.5
pkgrel=9
pkgdesc="Episode renamer is a simple python script that renames folders of TV episode video files to their proper names."
arch=('i686' 'x86_64')
url="http://github.com/Tovok7/episode-renamer"
license=('BSD')
depends=('python-simplejson>=2.0.9')
makedepends=('python2' 'python2-distribute' 'git')
provides=('episoderenamer')

_gitroot='git://github.com/Tovok7/episode-renamer.git'
_gitname='episode-renamer'

build() {
  cd ${srcdir}

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot
  fi

  cd $_gitname
  python2 ./setup.py install --root="${pkgdir}" --prefix="/usr" || return 1
}

