# Maintainer: Marco Milch <marco.milch@freenet.de>

pkgname=quick2wire-gpio-admin
pkgver=20130523
pkgrel=1
pkgdesc="A command-line tool to export or unexport the Raspberry Pi's GPIO pins."
arch=(armv6h)
url="https://github.com/quick2wire/quick2wire-gpio-admin"
license=('MIT' 'LGPL')
options=('!emptydirs' '!strip')
source=('Makefile.patch')
md5sums=('0fd541b93076359b3de51af3ec66f465')

_gitroot='https://github.com/quick2wire/quick2wire-gpio-admin.git'
_gitname='quick2wire-gpio-admin'

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

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  cd "${srcdir}/$_gitname-build"
  rm -rf build
  
  patch -uN Makefile ../Makefile.patch
  
  make
}

package() {
  cd "${srcdir}/$_gitname-build"
  
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
