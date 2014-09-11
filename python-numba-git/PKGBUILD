pkgname=python-numba-git
pkgver=0.13.4.0.418.ga8a8c68
pkgrel=1
epoch=1
pkgdesc="NumPy aware dynamic Python compiler using LLVM"
url="https://github.com/numba/numba"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python' 'python-llvmpy-git' 'python-meta-git' 'python-llvmmath-git'
  'python-numpy')
makedepends=('git' 'cython')
provides=('python-numba')
options=('debug' 'strip')

_gitname=numba

_gitroot=https://github.com/numba/numba.git
_gitref=master
exec 5>&1

_fetch_git() {
  cd "$srcdir"

  if [ -d "$srcdir/$_gitname/.git" ]; then
    cd "$_gitname"
    msg "Reset current branch"
    git reset --hard HEAD
    git clean -fdx
    msg "Fetching branch $_gitref from $_gitroot..."
    git fetch --force --update-head-ok \
      "$_gitroot" "$_gitref:$_gitref" --
    msg "Checking out branch $_gitref..."
    git checkout "$_gitref" --
    git reset --hard "$_gitref"
    git clean -fdx
    msg "The local files are updated."
  else
    msg "Cloning branch $_gitref from $_gitroot to $_gitname..."
    git clone --single-branch --branch "$_gitref" \
      "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi
  msg "GIT checkout done or server timeout"
}

pkgver() {
  (_fetch_git >&5 2>&1)
  cd "$srcdir/$_gitname"

  git describe | sed -e 's/-/.0./' -e 's/-/./g'
}

build() {
  (_fetch_git)
  # setup.py install seems to recompile everything anyway...
}

package() {
  cd "$srcdir/$_gitname"

  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
