# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from Mercurial(hg) sources.

# Contributor: Mathias Laurenz Baumann <marenzXfbuild@supradigital.org>
pkgname=xfbuild-hg
pkgver=86
pkgrel=1
pkgdesc="Fork of rebuild/dsss, a build-system for D"
arch=('i686')
url="http://bitbucket.org/h3r3tic/xfbuild/"
license=('GPL')
groups=()
depends=()
makedepends=('mercurial')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_hgroot="http://bitbucket.org/h3r3tic"
_hgrepo="xfbuild"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot/xfbuild $_hgrepo || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #
	dmd $* -I../..  -L-ldl -ofxfbuild @modList.lst || return 1
	mkdir $pkgdir/bin
	cp xfbuild $pkgdir/bin/

#  ./build.sh

  #./autogen.sh
  #./configure --prefix=/usr
  #make || return 1
  #make DESTDIR="$pkgdir/" install || return 1
} 
