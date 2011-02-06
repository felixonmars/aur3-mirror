# Contributor: Vladimir Matveev <dpx.infinity at gmail point com>
#
pkgname=udisksevt-git
pkgver=20100817
pkgrel=2
pkgdesc="UDisks events handler daemon - git version"
arch=('i686' 'x86_64')
url="http://github.com/dpx-infinity/udisksevt/"
license=('GPL')
depends=('udisks' 'polkit' 'consolekit' 'dbus' 'gmp')
makedepends=('git' 'ghc' 'haskell-dbus-core' 'haskell-dbus-client3' 'haskell-text' 'haskell-stm')
conflicts=('udisksevt')
install="udisksevt.install"

_gitroot="git://github.com/dpx-infinity/udisksevt.git"
_gitname="udisksevt"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone -b dbus-client-0.3 $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  cd "$srcdir/$_gitname-build"
  make configure || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"

  install -m755 -D ./dist/build/udisksevt/udisksevt $pkgdir/usr/bin/udisksevt || return 1
  install -m644 -D ./udisksevt.conf $pkgdir/usr/share/$pkgname/udisksevt.conf.example || return 1
} 
