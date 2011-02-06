# Maintainer: Oliver Weidner <Oliver dot Weidner at gmail dot com>

pkgname=bugfree-git
pkgver=20100410
pkgrel=1
pkgdesc="plaintext based bugtracker"
arch=('any')
url="http://github.com/hut/bugfree"
license=('unknown')
depends=('ruby')
makedepends=('git')

_gitroot="git://github.com/hut/bugfree.git"
_gitname="bugfree"

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

  #
  # install
  #

  install -dm755 ${pkgdir}/usr/{bin,share/bugfree}
  cp -r * ${pkgdir}/usr/share/bugfree/
  ln -s /usr/share/bugfree/bf ${pkgdir}/usr/bin/bf
} 
