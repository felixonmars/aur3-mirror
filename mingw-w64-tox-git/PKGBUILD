# Maintainer : GI_Jack <iamjacksemail@hackermail.com>
# Contributer: urras   <urras@tox.im>

pkgname=mingw-w64-tox-git
_gitname=toxcore
pkgver=3143.af10ca7
pkgrel=3
pkgdesc="A FOSS instant messaging application aimed to replace Skype (mingw-w64)"
arch=('any')
url="https://github.com/irungentoo/toxcore"
license=('GPL3')
conflicts=('mingw-w64-tox')
provides=('mingw-w64-tox')
makedepends=('mingw-w64-configure' 'git')
#makedepends=('mingw-w64-gcc' 'mingw-w64-pkg-config' 'git')
depends=('mingw-w64-crt' 'mingw-w64-libsodium' 'mingw-w64-opus' 'mingw-w64-libvpx')
options=('staticlibs' '!strip' '!buildflags')
source=("git://github.com/irungentoo/toxcore.git")
md5sums=('SKIP')
_targets="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_gitname}"
  autoreconf -fi
  for _target in ${_targets}; do
    unset LDFLAGS CPPFLAGS
    mkdir -p "${srcdir}/${_gitname}/build-${_target}" && \
	  cd "${srcdir}/${_gitname}/build-${_target}"
    ${_arch}-configure
    #../configure --prefix=/usr/${_target} \
                 #--host=${_target} \
		 #--enable-shared \
		 #--enable-static
    make
  done
}

package() {
  for _target in ${_targets}; do
    cd "${srcdir}/${_gitname}/build-${_target}"
    make DESTDIR="$pkgdir" install
    ${_target}-strip --strip-unneeded "${pkgdir}"/usr/"${_target}"/bin/*.dll
    #${_target}-strip -g "${pkgdir}/usr/${_target}/lib/*.a"
  done
}

