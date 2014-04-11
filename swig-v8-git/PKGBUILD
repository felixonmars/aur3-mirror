# Maintainer: Tom Ingleby <tom@ewsting.org> 
#
# Header of orginal swig-git from AUR
# Contributor: Philipp Gesang <phg42.2a@gmail.com>
# header of the original swig PKGBUILD in extra:
# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=swig-v8-git
pkgver=3.0.1
pkgrel=1
pkgdesc="Generate scripting interfaces to C/C++ code"
arch=("i686" "x86_64")
url="https://github.com/oliver----/swig-v8"
license=("custom")
depends=("zlib" "pcre")
optdepends=("nodejs")
makedepends=("git" "yodl")
conflicts=("swig")
provides=("swig" "swig=3.0.1")

_gitname="swig"

source=("${_gitname}::git+https://github.com/oliver----/swig-v8")
sha1sums=("SKIP")

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  sed -i "s/src\/node.h/node\/node.h/g" Lib/javascript/v8/node.i
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}-build"
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 LICENSE-UNIVERSITIES "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-UNIVERSITIES
}
