# Maintainer: Wojciech Siewierski <darkvifon at gmail dot com>
# Contributor: Wojciech Siewierski <darkvifon at gmail dot com>
pkgname=vfnmake-git
pkgver=20120331
pkgrel=1
pkgdesc="User friendly Makefile generator for C/C++"
url="https://github.com/Vifon/vfnmake"
arch=('any')
conflicts=('vfnmake')
provides=('vfnmake')
license=('GPL')
optdepends=('nasm: Assembly support'
  'qt: Qt4 support'
  'zsh: argument completion')
makedepends=('git')

_gitroot="git://github.com/Vifon/vfnmake.git"
_gitname="vfnmake"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin --depth=1
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname --depth=1
  fi

  msg "GIT checkout done or server timeout"
  rm -rf "$srcdir/$_gitname-build"
  cp -r  "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd     "$srcdir/$_gitname-build"
  make AUR_prepare
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D -m 755 vfnmake_with_pod "$pkgdir/usr/bin/vfnmake"
  install -D -m 644 vfnmake.1.gz     "$pkgdir/usr/share/man/man1/vfnmake.1.gz"
  install -D -m 644 _vfnmake         "$pkgdir/usr/share/zsh/site-functions/_vfnmake"
  install -D -m 644 vfnmake.conf     "$pkgdir/etc/vfnmake.conf"
}
