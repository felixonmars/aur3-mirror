# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
pkgname=include-what-you-use-svn
pkgver=559
pkgrel=1
pkgdesc="A tool for use with clang to analyze includes in C and C++ source files"
_pkgname=include-what-you-use
arch=('i686' 'x86_64')
url='http://code.google.com/p/include-what-you-use'
license=('LLVM Release License')
makedepends=('python2')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(
    'include-what-you-use::svn+http://include-what-you-use.googlecode.com/svn/trunk'
    'llvm::svn+http://llvm.org/svn/llvm-project/llvm/trunk'
    'clang::svn+http://llvm.org/svn/llvm-project/cfe/trunk'
    include-what-you-use-llvm.patch
)
noextract=()
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '180ba558c60bc86d747a40f1818e88da')

pkgver() {
  cd "$srcdir/$_pkgname"
  svnversion|tr -d '[A-Z]'
}

build() {
  cd "$srcdir"

  ln -snf ../../"$_pkgname" clang/tools/"$_pkgname"
  ln -snf ../../clang llvm/tools/clang

  msg "Patching..."
  patch -Np0 -i include-what-you-use-llvm.patch

  builddir="$srcdir/build"
  mkdir -p "$builddir"
  cd "$builddir"
  cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D PYTHON_EXECUTABLE=/usr/bin/python2 \
    "$srcdir/llvm"
  make -j$(grep -c proc /proc/cpuinfo)
}

package() {
  cd "$srcdir"

  install -Dm755 \
    "build/bin/$_pkgname" \
    "$pkgdir/usr/bin/$_pkgname"

  ln -s "$_pkgname" \
    "$pkgdir/usr/bin/iwyu"

  install -Dm755 \
    "$_pkgname/fix_includes.py" \
    "$pkgdir/usr/bin/iwyu-fix_includes.py"

  install -d "$pkgdir/usr/share/doc/$_pkgname"

  install -Dm644 \
    "$_pkgname/README.txt" \
    "$pkgdir/usr/share/doc/$_pkgname"

  install -d "$pkgdir/usr/share/$_pkgname"

  install -Dm644 \
    "$_pkgname"/*.imp \
    "$pkgdir/usr/share/$_pkgname"
}
