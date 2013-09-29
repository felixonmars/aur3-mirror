# Maintainer: Gianmarco Brocchi <brocchi@poisson.phc.unipi.it>

pkgname=valencia-gedit3-git
pkgver=20130426
pkgrel=2
pkgdesc="Turn gedit into a Vala development environment"
arch=('i686' 'x86_64')
url="http://yorba.org/valencia/"
license=('LGPL')
depends=('vala' 'libpeas' 'gtksourceview3' 'libgee' 'vte3')
makedepends=('git')
# provides=()
conflicts=('valencia')
# replaces=()
# backup=()
# options=()
install=${pkgname}.install
source=(makefile.patch)
md5sums=('1f24347e5d17f8d86052f2c603a0009f')
# noextract=()

_gitroot="git://yorba.org/valencia"
_gitname="valencia"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname" #--branch master
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  patch -i "$srcdir/makefile.patch" -p0 || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# package() {
#   cd "$srcdir/$_gitname-build"
#   make DESTDIR="$pkgdir/" install
# }
