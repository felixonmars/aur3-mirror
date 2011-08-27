# Maintainer: Ankit Shankar <ankitshankar+aur at gmail dot com>
pkgname=lawnmower-git
pkgver=20110127
pkgrel=1
pkgdesc="Automated login tool for Georgia Tech Local Area Wireless Network
(LAWN)."
arch=('x86_64' 'i686')
url="https://github.com/thelastnode/LAWNMower"
license=('BSD')
groups=()
depends=('qt>=4.6')
makedepends=('git' 'qt>=4.6')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('lawnmower.desktop')
noextract=()
md5sums=('2e0638a095aea90922a29b645cc3e019')

_gitroot="git://github.com/thelastnode/LAWNMower.git"
_gitname="lawnmower"

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

  qmake
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 LAWNMower "${pkgdir}/usr/bin/LAWNMower"
  cd "$startdir"
  install -D -m644 lawnmower.desktop "${pkgdir}/usr/share/applications/lawnmower.desktop"
}
