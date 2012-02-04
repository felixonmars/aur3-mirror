# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Noah Bieler <noah.bieler[at]gmx[dot]ch>
pkgname=logcli-git
pkgver=20110716
pkgrel=1
pkgdesc="Logs the date, the current directory and a note."
url="http://www.github.com/bielern/logcli"
arch=('x86_64' 'i686')
license=('GPLv3')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()

_gitroot="git://github.com/bielern/logcli.git"
_gitname="logcli"

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
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build" --depth=1
  cd "$srcdir/$_gitname-build"

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -d -m755 "${pkgdir}/usr/bin/"
  install -m755 l "${pkgdir}/usr/bin/l"
} 
