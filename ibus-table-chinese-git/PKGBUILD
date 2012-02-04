# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Leewings Ac <osideal@gmail.com>
# Contributor: Hiroshi Yui <hiroshiyui@gmail.com>

pkgname=ibus-table-chinese-git
pkgver=20111222
pkgrel=1
pkgdesc="Some table-based input method of tables engines for IBus"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ibus/"
license=('GPLv3')
provides=('ibus-table-chinese')
depends=('ibus-table>=1.2' 'aspell-en' 'python2-pyenchant')
makedepends=('cmake')
source=(https://fedorahosted.org/releases/c/m/cmake-fedora/cmake-fedora-modules-only-latest.tar.gz)
md5sums=(eb24ff0ec5b7646dd1b077f3b379712b)

_gitroot="git://github.com/definite/ibus-table-chinese.git"
_gitname="ibus-table-chinese"

build()
{
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin master
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  
  tar zxvf "$srcdir/cmake-fedora-modules-only-latest.tar.gz"

  cmake . -DCMAKE_INSTALL_PREFIX='/usr' -DLIBEXEC_DIR='/usr/libexec'
  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="${pkgdir}" install
}
