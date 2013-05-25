# Maintainer: perlawk
pkgname=talib-python-git
pkgver=0.1
pkgrel=1
pkgdesc="This is a Python wrapper for TA-LIB based on Cython and Numpy to efficiently and cleanly bind to TA-Lib -- producing results 2-4 times faster than the SWIG interface."
arch=(any)
url="https://github.com/mrjbq7/ta-lib"
license=('GPL')
groups=()
depends=('python2' 'ta-lib' 'cython2')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'
_gitroot=https://github.com/mrjbq7/ta-lib.git 
_gitname=talib-python

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
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
