# Maintainer: Björn Lindig <bjoern.lindig@googlemail.com>
# Contributor: Arch Linux Pro Audio <archaudio-devel@archaudio.org>
pkgname=supercollider-git-with-plugins-git
pkgver=20110429
pkgver_plugins=453
pkgrel=1
pkgdesc="An environment and programming language for real time audio synthesis and algorithmic composition. Extended package with SC3-Plugins."
url="http://supercollider.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
if [ ${CARCH} = 'x86_64' ]; then
  depends=('jack' 'fftw' 'avahi' 'ruby' 'icu' 'gcc-libs-multilib')
else
  depends=('jack' 'fftw' 'avahi' 'ruby' 'icu')
fi

makedepends=('git' 'libsndfile>=1.0' 'emacs' 'vim' 'gedit' 'gcc>=3.0' 'pkgconfig>=0.14.0' 'cmake' 'alsa-lib')
#optdepends=('emacs' 'vim' 'ruby' 'gedit')
conflicts=('supercollider')
provides=('supercollider-git')

source=()
md5sums=()
install=sc3.install

_gitroot="git://supercollider.git.sourceforge.net/gitroot/supercollider/supercollider"
_gitname="supercollider"

# For the Plugins
_gitroot2="git://sc3-plugins.git.sourceforge.net/gitroot/sc3-plugins/sc3-plugins"
_gitname2="sc3-plugins"
#_svntrunk="https://sc3-plugins.svn.sourceforge.net/svnroot/sc3-plugins"
#_svnmod="sc3-plugins"


build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    (cd $_gitname && git pull origin)
    msg "The local files are updated."
  else
    git clone $_gitroot --branch 3.4
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  if [ -d $_gitname-build ]; then
    rm -r $_gitname-build
  fi
  cp -r $_gitname $_gitname-build
  cd $_gitname-build/common

#  cmake -DCMAKE_INSTALL_PREFIX=/usr || return 1
#  make || return 1
#  make DESTDIR=$pkgdir/ install || return 1
  
  scons PREFIX=/usr SCED=yes DEVELOPMENT=yes READLINE=no || return 1
  scons DESTDIR=$pkgdir/ install || return 1

  scons -C ../editors/scvim PREFIX=$pkgdir/usr \
    VIMFILE_DIR=/usr/share/vim/addons install-system || return 1

  rm -rf $srcdir/$_gitname2-build

  msg "Done building SuperCollider"
  msg "Starting built of SC3-Plugins"

  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $_gitname2 ] ; then
    (cd $_gitname2 && git pull origin)
    msg "The local files are updated."
  else
    git clone $_gitroot2
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  if [ -d $_gitname2-build ]; then
    rm -r $_gitname2-build
  fi

  cp -r $_gitname2 $_gitname2-build
  cd $_gitname2-build

#  scons PREFIX=/usr SC3PATH=$srcdir/supercollider-build/common/ || return 1
#  scons DESTDIR=$pkgdir/ install || return 1
#  cmake -DCMAKE_INSTALL_PREFIX=/usr -DSC_PATH=$srcdir/supercollider-build/ || return 1
#  make || return 1
#  make DESTDIR=$pkgdir/ install || return 1

  rm -rf $srcdir/$_gitname2-build
}
# vim:syntax=sh
