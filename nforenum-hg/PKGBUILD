# Contributor: TheStarLion <thestarlion@hotmail.com>
pkgname=nforenum-hg
pkgver=234
pkgrel=1
pkgdesc="A tool to convert a GRF file into graphics files and meta data, and vice versa."
arch=('i686' 'x86_64')
url="http://dev.openttdcoop.org/projects/nforenum"
license=('GPL2')
depends=()
optdepends=('grfcodec')
makedepends=('mercurial' 'gcc' "boost>=1.43")
provides=(nforenum)
conflicts=(nforenum)
install=
#source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums=() #generate with 'makepkg -g'

_hgrepo="http://hg.openttdcoop.org/nforenum"

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
  rm -rf "$srcdir/nforenum-build"
#  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/nforenum" "$srcdir/nforenum-build"
#  cd "$srcdir/nforenum-build"
  cd "$srcdir/nforenum"

  #
  # BUILD HERE
  #

  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
} 
