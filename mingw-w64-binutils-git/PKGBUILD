# Maintainer: rubenvb vanboxem <dottie> ruben <attie> gmail <dottie> com
pkgname=mingw-w64-binutils-git
pkgver=2.22.51
pkgrel=1
pkgdesc="Cross binutils for the MinGW-w64 cross-compiler"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils"
license=('GPL')
groups=('mingw-w64')
depends=('zlib')
makedepends=('git')
#checkdepends=('dejagnu') # Windows executables could run on Arch through bin_mft and Wine
optdepends=()
provides=('mingw-w64-binutils')
conflicts=()
replaces=()
backup=()
options=('!libtool' '!emptydirs')
source=()
md5sums=()

_gitroot=git://repo.or.cz/binutils.git
_gitname=binutils

_targets="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  msg "Preparing build directory"

  cd "$srcdir/$_gitname"
  #do not install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in

  for _target in $_targets; do
    msg "Building ${_target} cross binutils"
    mkdir -p "$srcdir/$_gitname-build-${_target}" && cd "$srcdir/$_gitname-build-${_target}"
    $srcdir/$_gitname/configure --prefix=/usr \
        --target=${_target}\
        --infodir=$pkgdir/usr/share/info/${_target} \
        --enable-lto --enable-plugins \
        --disable-multilib --disable-nls
     make
  done
}

package() {
  for _target in ${_targets}; do 
    cd ${srcdir}/${_gitname}-build-${_target}
    make prefix=${pkgdir}/usr install
  done
}

