# Contributor: Ralf Barth <archlinux dot or at haggy dot org>
# Contributor: Richard Atkinson atkinsonr at gmail

pkgname=xbmc-skin-aeon-hitched-git
pkgver=20090902
pkgrel=1
pkgdesc="Aeon skin (Hitcher's mod) for XBMC (git version)"
arch=('i686' 'x86_64')
url="http://www.aeonproject.com/"
source=('http://dump.haggy.org/aur/aeon-hitched-fonts.rar')
md5sums=('a4b69e2a0f7444f6228d274dff14580f')
noextract=()
depends=('xbmc')
makedepends=('git' 'unrar')
provides=()
groups=('multimedia')
license=('GPL')
options=()

_gitroot="git://github.com/Hitcher/aeon.git"
_gitname="aeon"

build() {

  cd ${srcdir}
  msg "Connecting to github.com GIT server..."

  if [ ! -d ${srcdir}/$_gitname ] ; then
    msg "No local branch found, cloning remote branch..."
    git clone $_gitroot
    cd $srcdir/$_gitname && git pull
  fi
  msg "GIT checkout done or server timeout"

  # Copy tree to share location
  mkdir -p $pkgdir/usr/share/xbmc/skin/aeon_Hitched
  cp -r $startdir/src/$_gitname/* $pkgdir/usr/share/xbmc/skin/aeon_Hitched/

  # Extract fonts into skin location
  unrar x ${srcdir}/aeon-hitched-fonts.rar $pkgdir/usr/share/xbmc/skin/aeon_Hitched/
}

