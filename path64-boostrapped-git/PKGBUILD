# Contributor: Martin Peres <martin.peres@ensi-bourges.fr>
pkgname=path64-boostrapped-git
pkgver=20110409
pkgrel=1
pkgdesc="Path64 AMD64 optimized C/C++/Fortran compiler. Boostrapped version which results in lower compilation time"
arch=('x86_64')
url="http://www.path64.org"
license=('GPL')
groups=()
depends=('gcc42')
makedepends=('path64-git')
provides=('path64-git=$pkgver')
conflicts=('path64-git')
replaces=('path64-git')
backup=()
options=()
install=
source=('pathcc' 'pathCC' 'pathf90' 'pathf95')
noextract=()
md5sums=('79ef420a20168d9d159f50f5ba8fe6cc'
         '0b4a20d924e384c568b384f7be5d5f8c'
         'e213571bf1dacccd94e3556b1a091e62'
         '5386cd97a53de154fe8747ef5d0fe2d1')

_gitroot="http://github.com/path64/compiler.git"
_gitname="path64"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  # Release
  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  mkdir "$srcdir/$_gitname-build/build"
  cd "$srcdir/$_gitname-build/build"
  
  # Debug
  #mkdir "$srcdir/$_gitname/build"
  #cd "$srcdir/$_gitname/build"
  
  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS

  LDFLAGS="-s"

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DPATH64_ENABLE_TARGETS="x86_64" \
        -DPATH64_ENABLE_MATHLIBS=ON \
        -DPATH64_ENABLE_FORTRAN=ON \
        -DPSC_CRT_PATH_x86_64=/usr/lib \
        -DPSC_DYNAMIC_LINKER_x86_64=/lib/ld-linux-x86-64.so.2 \
        -DPSC_LIBSUPCPP_PATH_x86_64=/usr/lib/gcc/x86_64-linux-gnu/4.2.4 \
        -DPSC_LIBSTDCPP_PATH_x86_64=/usr/lib/gcc/x86_64-linux-gnu/4.2.4 \
        -DPSC_LIBGCC_PATH_x86_64=/usr/lib/gcc/x86_64-linux-gnu/4.2.4 \
        -DPSC_LIBGCC_EH_PATH_x86_64=/usr/lib/gcc/x86_64-linux-gnu/4.2.4 \
        -DPSC_LIBGCC_S_PATH_x86_64=/usr/lib/gcc/x86_64-linux-gnu/4.2.4 \
	-DCMAKE_Fortran_COMPILER=/usr/bin/pathf95 \
	-DCMAKE_C_COMPILER=/usr/bin/pathcc \
	-DCMAKE_CXX_COMPILER=/usr/bin/pathCC \
	.. 

  make PATHGPP=/usr/bin/g++-4.2   || return 1
  make DESTDIR="$pkgdir/" install || return 1

  # Python fixes
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" "$pkgdir/opt/path64/bin/explain"


  # Install the wrapper in /usr/bin
  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/pathcc" "$pkgdir/usr/bin/"
  cp "$srcdir/pathCC" "$pkgdir/usr/bin/"
  cp "$srcdir/pathf90" "$pkgdir/usr/bin/"
  cp "$srcdir/pathf95" "$pkgdir/usr/bin/"
}

