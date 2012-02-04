# Maintainer: crazyelf5

pkgname=extended-actions-bzr
pkgver=5
pkgrel=1
pkgdesc="Service for generating extended actions on files"
arch=('i686' 'x86_64')
url="https://launchpad.net/extended-actions"
license=('GPL3')
depends=('glib2' 'libgee' 'glibc')
makedepends=('bzr' 'gcc' 'vala' 'cmake')
optdepends=('avconvert: Audio/Video conversion integration [AUR]')
source=('avconvert.desktop')
md5sums=('5d7c3c3b8e4cbc4dc589ad6499964e48')

_bzrtrunk=lp:extended-actions
_bzrmod=extended-actions

build() {
  msg "Connecting to Bazaar server...."

  if [ -d $_bzrmod ]; then
    cd $_bzrmod && bzr pull $_bzrtrunk -r $pkgver
    msg "The local files are updated."
    cd "$srcdir"
  else
    bzr branch $_bzrtrunk $_bzrmod -r $pkgver
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d $_bzrmod-build ] && rm -rf $_bzrmod-build
  cp -r $_bzrmod $_bzrmod-build
  cd $_bzrmod-build
  [ -d build ] && rm -rf build
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_bzrmod-build/build"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install
  install -m644 "$srcdir/avconvert.desktop" "$pkgdir/usr/share/extended-actions"
}
