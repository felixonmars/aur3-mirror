# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Contributor: Your Name <mainiak at gmail dot com>
pkgname=gof-git
pkgver=20100707
pkgrel=1
pkgdesc="Git One File - RCS inspirated git wrapper"
arch=('any')
url="http://code.koudynet.eu/p/gof/"
license=('BSD')
groups=()
depends=('bash' 'git')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://code.koudynet.eu/gof.git "
_gitname="gof-git"

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
  # BUILD HERE
  #

  set -x
  mkdir -p "$pkgdir/usr/bin/"
  install -m775 "$srcdir/$_gitname-build/gof.sh" "$pkgdir/usr/bin/gof"
}
