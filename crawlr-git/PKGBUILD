# Maintainer: Kaivo Anastetiks <kaivo dot anastetiks at gmail dot com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=crawlr-git
pkgver=20091124
pkgrel=2
pkgdesc="A 2D dungeon exploration game written in Python."
arch=('i686' 'x86_64')
url="http://github.com/mfiano/crawlr"
license=('GPL3')
depends=('python2-pygame')
makedepends=('git')

_gitroot="git://github.com/mfiano/crawlr.git"
_gitname="crawlr"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/$_gitname-build
  git clone ${srcdir}/$_gitname ${srcdir}/$_gitname-build
}

package() {
  cd ${srcdir}/$_gitname-build
  install -d ${pkgdir}/usr/{bin,share/crawlr} || return 1
  mv * ${pkgdir}/usr/share/crawlr || return 1
  echo -e "#!/bin/sh\n\ncd /usr/share/crawlr\npython2 ./play.py" > crawlr
  install -m755 crawlr ${pkgdir}/usr/bin/crawlr || return 1
}
