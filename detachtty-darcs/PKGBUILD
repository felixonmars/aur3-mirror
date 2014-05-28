# Maintainer: Quinn Evans <yoshizuki@gmail.com>
# Contributor: Isaac Praveen <icylisper@gmail.com>
pkgname=detachtty-darcs
pkgver=r6
pkgrel=1
pkgdesc="Utility that lets you run interactive programs (such as Lisp) non-interactively (with timeout and eval patches)"
arch=any
url="http://www.cliki.net/detachtty"
license=('GPL')
depends=()
provides=('detachtty')
conflicts=('detachtty')
makedepends=('gcc' 'wget') 
md5sums=('SKIP')
_darcstrunk="http://common-lisp.net/project/bese/repos/detachtty"
_darcsname=detachtty

prepare() {
  cd $srcdir
  msg "Retrieving complete sources"
  wget -r -np --cut-dirs=3 -nH $_darcstrunk/
}

pkgver() {
#  cd $srcdir
#  darcs show repo --xml-output | awk '/<numpatches>/ { getline; printf("r%s\n", $1) }'
  cd $srcdir/$_darcsname/_darcs/patches
  echo r$((`ls | wc -l` - 2))
}

build() {
  cd $srcdir
#  msg "Checking for previous build...."
#
#  if [[ -d "$_darcsname/_darcs" ]]; then
#    msg "Retrieving missing patches"
#    cd "$_darcsname"
#    darcs pull -a "$_darcstrunk/"
#  else
#    msg "Retrieving complete sources"
#    darcs get "$_darcstrunk"
#    cd "$_darcsname"
#  fi

  rm -rf "$srcdir/$_darcsname-build"
  cp -r "$srcdir/$_darcsname" "$srcdir/$_darcsname-build"
  cd "$srcdir/$_darcsname-build"

  msg "Starting build..."

  make
}

package() {
  cd $srcdir/$_darcsname-build
  mkdir -p $pkgdir/usr/bin
  make DESTDIR="$pkgdir" INSTALL_DIR="/usr/bin" install
  mkdir -p $pkgdir/usr/share/man/man1
  gzip detachtty.1
  install -m 644 detachtty.1.gz $pkgdir/usr/share/man/man1
}
