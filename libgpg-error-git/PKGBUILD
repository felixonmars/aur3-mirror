# libgpg-error GIT version
# Taken from official libgpg-error and gnupg2-git pkgbuild files
# Maintainer: djhaskin987@gmail.com

pkgname=libgpg-error-git
pkgver=20140915
pkgrel=1
pkgdesc="Support library for libgcrypt"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.gnupg.org/"
depends=('glibc' 'sh')
makedepends=('git' 'automake-1.11')
provides=("libgpg-error=${pkgver}")
replaces=("libgpg-error")

_gitroot="git://git.gnupg.org/libgpg-error.git"
_gitname="libgpg-error"


build() {
 # cd ${srcdir}/gnupg-$pkgver
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin master
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  AUTOMAKE_SUFFIX="-1.11" ./autogen.sh --force
  ./configure --enable-maintainer-mode \
              --prefix=/usr
  make
}

check() {
  cd "$srcdir/$_gitname-build"
  make check
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="${pkgdir}/" install
}
