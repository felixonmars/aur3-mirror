# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from CVS sources.

# Contributor: Aaron Krister Johnson <aaron@akjmusic.com>
pkgname=csound5.12-cvs
pkgver=20100714
pkgrel=1
pkgdesc="powerful general software synthesis language"
arch=('i686')
url="http://www.csounds.com"
license=('GPL')
groups=()
depends=('liblo' 'fltk')
makedepends=('cvs')
provides=('csound5')
conflicts=('csound5' 'csound5-cvs')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_cvsroot=":pserver:anonymous:@csound.cvs.sourceforge.net:/cvsroot/csound"
_cvsmod="csound5"

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -P csound5
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

  #
  # BUILD HERE
  #

  scons buildCSEditor=1 buildImageOpcodes=0 buildCsound5GUI=1 buildVirtual=1 noFLTKThreads=0 useALSA=1 usePortMIDI=1 useJack=1 useOSC=1 || return 1
  ./install.py --prefix=/usr --instdir=$pkgdir
}
