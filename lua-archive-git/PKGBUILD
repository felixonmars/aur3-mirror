# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=lua-archive-git
pkgver=20100318
pkgrel=1
pkgdesc="Lua libarchive integration."
arch=('i686' 'x86_64')
url="http://github.com/brimworks/lua-archive/"
license=('MIT')
depends=('lua')
makedepends=('git' 'cmake')
provides=('lua-archive')
conflicts=('lua-archive')
source=('LICENSE')
md5sums=('838c366f69b72c5df05c96dff79b35f2')

_gitroot="git://github.com/brimworks/lua-archive.git"
_gitname="lua-archive"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  sed -i 's|share/lua/cmod|lib/lua/5.1|' CMakeLists.txt
  cmake . -DCMAKE_INSTALL_PREFIX="/usr" || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR=${pkgdir} install || return 1
  install -Dm644 ${srcdir}/LICENSE \
  	${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
} 
