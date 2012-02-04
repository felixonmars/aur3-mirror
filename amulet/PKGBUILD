# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=amulet
pkgver=20110219
pkgrel=1
pkgdesc="Audio converter based on ffmpeg."
arch=('i686' 'x86_64')
url="http://gitorious.org/amulet"
license=('GPL')
depends=('ffmpeg' 'qt' 'git')
makedepends=()
source=()

md5sums=('5179bf5f74de5a1dde47a11b18e2876c')

_gitroot="git://gitorious.org/amulet/amulet.git"
_gitname="amulet"

build() {

  cd $srcdir
  msg "Connecting to the GIT server...."

  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done"
  msg "Starting make..."

  rm -rf $srcdir/$_gitname-build
  git clone $srcdir/$_gitname $srcdir/$_gitname-build

  cd $srcdir/$_gitname-build

  #cd "$srcdir/$pkgname"

  qmake ../$pkgname/$pkgname.pro || return 1
  make || return 1
  #install -D 
}

package() {
  cd "$srcdir/$pkgname-build"

  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  mkdir -p $pkgdir/usr/share/$pkgname/extensions/
  install -Dm644 extensions/* $pkgdir/usr/share/$pkgname/extensions/
  install -Dm644 icons/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 man.pdf $pkgdir/usr/share/$pkgname/
}

# vim:set ts=2 sw=2 et:
