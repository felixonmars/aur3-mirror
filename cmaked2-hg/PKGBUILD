# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from Mercurial(hg) sources.

# Contributor: Your Name <youremail@domain.com>
pkgname=cmaked2-hg
pkgver=51
pkgrel=1
pkgdesc="Cmake module for the D language, version 2."
arch=('i686' 'x86_64')
url="http://cmaked2.googlecode.com/"
license=('GPL')
groups=()
depends=('cmake')
makedepends=('mercurial')
provides=('cmaked')
conflicts=('cmaked')
install=
#source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums=() #generate with 'makepkg -g'

_hgroot=http://cmaked2.googlecode.com/hg
_hgrepo=cmaked2

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #
   cd cmaked

   mkdir build;
   cd build;
   cmake .. || exit 1;

   make install DESTDIR=$startdir/pkg|| exit 1;
} 
