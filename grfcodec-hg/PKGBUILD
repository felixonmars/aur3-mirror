# Contributor: TheStarLion <thestarlion@hotmail.com>
pkgname=grfcodec-hg
pkgver=234
pkgrel=1
pkgdesc="Tools for working with OpenTTD and TTDP .grf files"
arch=('i686' 'x86_64')
url="http://dev.openttdcoop.org/projects/grfcodec"
license=('GPL2')
depends=()
makedepends=('mercurial' 'gcc' "boost>=1.43")
optdepends=('nforenum')
provides=(grfcodec)
conflicts=(grfcodec)
install=
#source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums=() #generate with 'makepkg -g'

_hgrepo="http://hg.openttdcoop.org/grfcodec"

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

#  rm -rf "$srcdir/$_hgrepo-build"
  rm -rf "$srcdir/grfcodec-build"
#  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/grfcodec" "$srcdir/grfcodec-build"
#  cd "$srcdir/grfcodec-build"
  cd "$srcdir/grfcodec"

  #
  # BUILD HERE
  #

  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
} 
