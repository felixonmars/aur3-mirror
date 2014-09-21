#Maintainer: Yichao Yu <yyc1992@gmail.com>
#Contributor: Yichao Yu <yyc1992@gmail.com>

pkgname=python-sympy-git
_realver=0.7.5
pkgver=0.7.5.0.2043.gb11d3f9
pkgrel=1
pkgdesc="A Python library for symbolic mathematics. Python3 git version"
depends=('python' 'python-numpy')
optdepends=('ipython: user friendly interface for isympy')
arch=('any')
makedepends=('git')
url="https://github.com/sympy/sympy"
license=('BSD')
provides=("python-sympy=${_realver}")
conflicts=("python-sympy")

_gitname=sympy

_gitroot=git://github.com/sympy/sympy.git
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

  git describe --tags | sed -e 's/^[^0-9]*//g' -e 's/-/.0./' -e 's/-/./g'
}

build() {
  (_fetch_git)
  cd "$srcdir/$_gitname"

  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"

  python setup.py install --prefix=/usr --root "${pkgdir}" --optimize=1

  mv "${pkgdir}/usr/bin/isympy" "${pkgdir}/usr/bin/isympy-py3"
  mv "${pkgdir}/usr/share/man/man1/isympy.1" \
    "${pkgdir}/usr/share/man/man1/isympy-py3.1"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-sympy/LICENSE"
}
