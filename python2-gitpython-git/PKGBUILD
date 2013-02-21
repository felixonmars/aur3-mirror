# Maintainer: Johannes Fürmann <waaaaargh@quantentunnel.de>
pkgname=python2-gitpython-git
pkgver=20130221
pkgrel=1
pkgdesc="git library for python2"
arch=(x86_64 i686)
url="https://pypi.python.org/pypi/GitPython/"
license=('GPL')
groups=()
depends=('python' 'python-gitdb' 'ez-setup')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=()
md5sums=()

_gitroot=https://git.gitorious.org/git-python/mainline.git
_gitname=mainline

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
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
