# Maintainer: Igor Yanchenko <yanchenko.igor@gmail.com>
pkgname=snakefire-git
pkgver=20130327
pkgrel=1
pkgdesc='A Campfire desktop client'
arch=('i686' 'x86_64' 'ppc')
url='http://snakefire.org'
license=('MIT')
depends=('python2' 'python2-pyqt' 'python2-keyring' 'python2-notify' 'python-pyfire>=0.3.4' 'kdebindings-python2')
optdepends=('python-gnomekeyring: For GNOME/XFCE/LXDE users that require notifications' 'python2-pyenchant: For spell checking support')
makedepends=('python2' 'python2-distribute')
provides=('snakefire')
conflicts=('snakefire')
replaces=('snakefire')

_gitroot=https://github.com/mariano/snakefire.git
_gitname=snakefire

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

  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install -O1 --skip-build --install-menu-in-user-mode --root="$pkgdir"
}
