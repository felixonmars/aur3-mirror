# Maintainer: Perberos <perberos@gmail.com>
pkgname=python-corba
pkgver=20130217
pkgrel=1
pkgdesc="Python binding for Mate CORBA"
arch=('i686' 'x86_64')
url="https://github.com/mate-desktop/python-corba"
license=('GPL')
depends=('python2' 'mate-corba')
makedepends=('pkgconfig' 'git' 'mate-common>=20130129' 'mate-doc-utils')
options=('!emptydirs' '!libtool')
groups=('mate-extras')
source=()
sha256sums=()

_gitroot=git://github.com/mate-desktop/python-corba.git
_gitname=python-corba

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
  cd "$srcdir/$_gitname-build"

  export PYTHON=python2
  
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="${pkgdir}" install || return 1
}
