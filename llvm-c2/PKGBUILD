
# Maintainer: Jordy van Wolferen <jordy@kluisip.nl>

pkgname=llvm-c2
pkgver=3.4
pkgrel=1
pkgdesc="LLVM with C2 support"
arch=('i686' 'x86_64')
url="http://c2lang.org"
license=('unknown')
depends=()
makedepends=('git' 'python2')
options=('staticlibs')
source=("llvm::git+git://github.com/llvm-mirror/llvm.git#branch=release_34"
        "clang-c2::git+git://github.com/c2lang/clang.git#branch=c2master_34"
        "http://llvm.org/releases/${pkgver}/compiler-rt-${pkgver}.src.tar.gz")
md5sums=('SKIP'
         'SKIP'
         '7938353e3a3bda85733a165e7ac4bb84')

build() {
  cd "$srcdir"/llvm/projects
  mv "$srcdir"/compiler-rt-${pkgver} compiler-rt

  cd "$srcdir"/llvm/tools
  mv "$srcdir"/clang-c2 clang

  cd "$srcdir"/llvm

  ./configure \
    --prefix=/opt/llvm-c2 \
    --enable-optimized \
    --with-python=/usr/bin/python2

  make
}

package() {
  cd "${srcdir}"/llvm
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}"
  mkdir -p etc/profile.d
  echo 'export PATH=$PATH:/opt/llvm-c2/bin' > etc/profile.d/${pkgname}.sh
  chmod 775 etc/profile.d/${pkgname}.sh
}

# vim:set ts=2 sw=2 et:
