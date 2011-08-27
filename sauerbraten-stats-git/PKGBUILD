# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
pkgname=sauerbraten-stats-git
pkgver=20100808
pkgrel=1
pkgdesc="Put persistent stats on the sauerbraten scoreboard."
arch=('i686' 'x86_64')
url="http://github.com/sjuxax/cube2_stable"
license=('mit')
depends=('sauerbraten=2010_07_28_justice_edition-2')
makedepends=('git')

_gitroot="git://github.com/sjuxax/cube2-stable.git"
_gitname="cube2-stable"

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

  #rm -rf "$srcdir/$_gitname-build"
  #git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname"

  make || return 1
  mkdir -p ${pkgdir}/opt/sauerbraten/bin
  cp /opt/sauerbraten/bin/linux_client ${pkgdir}/opt/sauerbraten/bin/no-score-linux_client
  cp sauer_client ${pkgdir}/opt/sauerbraten/bin/linux_client
}
