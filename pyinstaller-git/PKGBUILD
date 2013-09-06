# Maintainer: Pedram Navid <pedram.navid at gmail dot com>
pkgname=pyinstaller-git
pkgver=20130902
pkgrel=1
pkgdesc="An application to convert python scripts into stand-alone binaries, git-version"
arch=('i686', 'x86_64')
url="https://github.com/pyinstaller/pyinstaller"
license=('GPL')
depends=('python')
makedepends=('git')
optdepends=('upx: UPX compression support')
provides=('pyinstaller')
conflicts=('pyinstaller')
md5sums=() #generate with 'makepkg -g'


_gitroot=https://github.com/pyinstaller/pyinstaller
_gitname=pyinstaller

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

  #
  # BUILD HERE
  #
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
