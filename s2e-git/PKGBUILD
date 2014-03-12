# Maintainer: Eric Schulte <schulte.eric@gmail.com>
#
# This package demonstrates one successful build of S2E on Arch Linux
# performed from the S2E git repo on 2014-03-11, this is likely not
# the best way to build S2E on Arch, just a working example.
#
# Since S2E doesn't support any "make install" command, and the
# functionality is not cleanly isolated into stand-along executables,
# the package function simply copies all release directories in their
# entirety to $pkgdir/share/s2e/.
#
pkgname=s2e-git
pkgver=0b5e0e4
pkgrel=1
pkgdesc="A Platform for In-Vivo Multi-Path Software Analysis"
arch=('i686' 'x86_64')
url="https://s2e.epfl.ch/"
license=('BSD')
depends=('lua51' 'nasm' 'gcc-libs' 'libffi' 'python2' "gcc>=4.7.0")
makedepends=('git' 'subversion' 'cmake')
provides=('s2e')
conflicts=('s2e')
source=("$pkgname::git+git://github.com/dslab-epfl/s2e.git"
        'Fix-a-build-failure-on-Debian-unstable.patch'
        'STP-parsers-Fix-build-on-Debian-unstable.patch'
        'not-building-guest-tools32.patch')
md5sums=('SKIP'
         '6fc8758efa10fe40806aedb59eb77648'
         '17408d6019284b8de10b5908fb98bc24'
         '227ffb8b6746f02c39af2ac12107725e')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --always|sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  # Apply patches located in ./patches/
  git am "$srcdir/Fix-a-build-failure-on-Debian-unstable.patch"
  git am "$srcdir/STP-parsers-Fix-build-on-Debian-unstable.patch"
  git am "$srcdir/not-building-guest-tools32.patch"
}

build() {
  cd "$srcdir/$pkgname"
  # Move into build directory
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  make -f "$srcdir/$pkgname/Makefile" \
       EXTRA_QEMU_FLAGS=--disable-werror
                        # "--extra-cflags=-Qunused-arguments --extra-cxxflags=-Qunused-arguments" \
       # LLVM_CFLAGS="-Qunused-arguments"
       # LLVM_CXXFLAGS="-Qunused-arguments"
       # 
}

package() {
    mkdir -p "$pkgdir/share/s2e"
    mv "$srcdir/build/llvm-release" "$pkgdir/share/s2e/"
    mv "$srcdir/build/qemu-release" "$pkgdir/share/s2e/"
    mv "$srcdir/build/klee-release" "$pkgdir/share/s2e/"
    mv "$srcdir/build/tools-release" "$pkgdir/share/s2e/"
    mv "$srcdir/build/guest-tools64" "$pkgdir/share/s2e/"
    mv "$srcdir/build/stp" "$pkgdir/share/s2e/"
}
