# Maintainer: Darren Alton <dalton at stevens point edu>
pkgname=snes9x-libsnes-git
pkgver=20110525
pkgrel=1
pkgdesc="An implementation of libsnes using the SNES9x core."
url="https://github.com/Themaister/snes9x-libsnes/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc-libs')
makedepends=('intltool' 'nasm' 'git')
optdepends=('ssnes-git: simple frontend for libsnes')
source=()
md5sums=()

_gitroot="git://github.com/Themaister/snes9x-libsnes.git"
_gitname="snes9x-libsnes"

build() {
  cd "${srcdir}/"

  msg "Connecting to the GIT server...."

  if [[ -d "$srcdir/$_gitname" ]] ; then
    cd "$_gitname"
    git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot"
  fi

  cd "${srcdir}/${_gitname}/unix"

  ./configure || return 1
  make || return 1
  mkdir -p "${pkgdir}/usr/lib"
  install -m 755 libsnes.so "${pkgdir}/usr/lib/libsnes-snes9x.so" || return 1
}

