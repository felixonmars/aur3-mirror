# Maintainer: Bernhard Walle <bernhard@bwalle.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

# AUR Category: system

pkgname=xosview-git
pkgver=20140409
pkgrel=1
pkgdesc="Displays system stats such as cpu, memory, swap, and network usage"
arch=(i686 x86_64)
depends=('gcc-libs' 'libxpm')
makedepends=('git')
provides=('xosview')
conflicts=('xosview')
license=('GPL')
url="http://www.pogo.org.uk/~mark/xosview/"

_gitroot="git://github.com/hills/xosview.git"
_gitname="xosview"

pkgver() {
  cd $srcdir/$_gitname
  git show -s --pretty=format:'%ad' --date=short | sed -e 's/\-//g'
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make || return 1
  mkdir -p usr/{bin,man/man1,lib/X11/app-defaults}
}

package() {
  cd "$srcdir/$_gitname-build"
  make PREFIX=$pkgdir/usr install
}

# vim: ts=2 sw=2 et ft=sh
