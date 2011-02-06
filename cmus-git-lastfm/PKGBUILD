# Contributor: Matthew Treinish <mtreinish@gatech.edu>

pkgname=cmus-git-lastfm
pkgver=20100707
pkgrel=1
pkgdesc="A very feature-rich ncurses-based music player with Last.fm support"
url="http://gitorious.org/cmus/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libao' 'libmpcdec' 'ffmpeg' 'flac' 'libmad' 'faad2>=2.6.1')
makedepends=('git')
provides=('cmus')
conflicts=('cmus')

_gitroot="git://gitorious.org/cmus/cmus.git"
_gitname="cmus"
_gitpatch="http://github.com/hunner/cmus-audioscrobbler.git"
_gitpname="cmus-audioscrobbler"

build() {
  cd "${srcdir}"

  msg "connecting to gitorious.org git server"
  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin || return 1
  else
    git clone $_gitroot $_gitname || return 1
  fi

  if [ -d ${srcdir}/$_gitpname ] ; then
    cd ${srcdir}/$_gitpname && git pull origin || return 1
  else
    git clone $_gitpatch $_gitpname || return 1
  fi
  msg "git checkout done"
  
  rm -rf ${srcdir}/$_gitname-build
  cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build
  cd ${srcdir}/$_gitname-build
  
  msg "patching cmus for Last.fm/Audioscrobbler..."
  patch < ${srcdir}/$_gitpname/cmus-as.patch
  
  msg "starting make ..." 
  ./configure prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
