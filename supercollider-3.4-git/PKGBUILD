# $Id$
# Maintainer: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: hm_b < holger <at> music-nerds.net >

pkgname=supercollider-3.4-git
pkgver=20110512
pkgrel=1
pkgdesc="An environment and programming language for real time audio synthesis and algorithmic composition (bugfixes for the 3.4 branch) "
url="http://supercollider.sourceforge.net/"
license=('GPL')
depends=('jack' 'avahi' 'fftw')
arch=('i686' 'x86_64')
provide=('supercollider')
conflicts=('supercollider')
makedepends=('subversion' 'libsndfile>=1.0' 'emacs' 'vim' 'gedit' 'icu' 'gcc>=3.0' 'pkgconfig>=0.14.0' 'scons>=0.96' 'alsa-lib' 'cwiid' 'readline')
optdepends=(
  'emacs: Emacs Interface'
  'vim: Vim Interface'
  'gedit: GEdit Interface'
  'supercollider-with-extras: replace supercollider by this package for all the extra goodies'
)

_gitroot="git://supercollider.git.sourceforge.net/gitroot/supercollider/supercollider"
_gitname="supercollider"


build() {

  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    (cd $_gitname && git pull origin)
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  cp -r $_gitname $_gitname-build
  cd $srcdir/$_gitname-build/

  msg "GIT checkout done or server timeout"
  git checkout -t origin/3.4
  msg "Starting scons..."

  cd $srcdir/$_gitname-build/common

  scons PREFIX=/usr DEVELOPMENT=yes X11=yes SCEL=yes SCED=yes LID=yes WII=yes READLINE=no
  scons DESTDIR=$pkgdir/ install
  scons -C ../editors/scvim PREFIX=$pkgdir/usr VIMFILE_DIR=/usr/share/vim/addons install-system

  rm -rf $srcdir/$_gitname-build
}
