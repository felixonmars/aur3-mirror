	# Maintainer: Jianjun Mao <justmao945 at gmail dot com>

pkgname="libcxxabi-git"
pkgver=20121221
pkgrel=1
pkgdesc="a new implementation of low level support for a standard C++ library."
arch=('i686' 'x86_64')
url="http://libcxxabi.llvm.org/"
license=('MIT' 'UIUC')
depends=()
makedepends=('git' 'libunwind' 'clang' )
source=()
md5sums=()

_gitroot=http://llvm.org/git/libcxxabi/
_gitname=libcxxabi

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 "$_gitroot" "$_gitname"
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  cd ${srcdir}/${_gitname}

	# Build
	echo ${PWD}
	cd lib
	./buildit
}

package() {
	cd "$srcdir/${_gitname}"
	mkdir -p ${pkgdir}/usr/include
	mkdir -p ${pkgdir}/usr/lib
	install lib/libc++abi.so.1.0 ${pkgdir}/usr/lib/libc++abi.so.1.0
	ln -s /usr/lib/libc++abi.so.1.0 ${pkgdir}/usr/lib/libc++abi.so.1
	ln -s /usr/lib/libc++abi.so.1.0 ${pkgdir}/usr/lib/libc++abi.so
	install include/* ${pkgdir}/usr/include
	install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
