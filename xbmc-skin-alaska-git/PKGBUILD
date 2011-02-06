# Contributor: Ralf Barth <archlinux dot or at haggy dot org>

pkgname=xbmc-skin-alaska-git
pkgver=20100130
pkgrel=1
pkgdesc="Alaska skin for XBMC (git version)"
arch=('i686' 'x86_64')
url="http://www.aeonproject.com/alaska.html"
source=()
md5sums=()
noextract=()
depends=('xbmc')
makedepends=('git' 'unzip')
provides=()
groups=('multimedia')
license=('GPL')
options=()

_gitversion=""
_gitroot="git://github.com/HitcherUK/Alaska.git"
_gitname="Alaska"

build() {

  cd ${srcdir}
  msg "Connecting to github.com GIT server..."

  if [ ! -d ${srcdir}/$_gitname ] ; then
    msg "No local branch found, cloning remote branch..."
    git clone $_gitroot
  fi

  cd $srcdir/$_gitname && git checkout master; git pull
  msg "GIT checkout done or server timeout"

  # Copy tree to share location
  mkdir -p $pkgdir/usr/share/xbmc/skin/$_gitname
  cp -r $startdir/src/$_gitname/* $pkgdir/usr/share/xbmc/skin/$_gitname/
}

