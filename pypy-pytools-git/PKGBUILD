# $Id: PKGBUILD 108485 2014-03-27 14:48:16Z fyan $
# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

pkgbase=pypy-pytools-git
pkgname=pypy-pytools-git
pkgname=('pypy3-pytools-git' 'pypy-pytools-git')
pkgver=2014.3
pkgrel=2
pkgdesc="A collection of tools for Python"
arch=('any')
url="http://mathema.tician.de/software/pytools"
license=('MIT')
makedepends=('python2-setuptools' 'python-setuptools')

_gitname=pytools

_gitroot=git://github.com/inducer/pytools
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

  git describe --tags | sed -e 's/^[^0-9]*//' -e 's/-/.0./' -e 's/-/./g'
}

build() {
  (_fetch_git)
  rm -rf pytools-python2
  cp -a pytools{,-python2}

  cd "$srcdir/pytools"
  pypy3 setup.py build

  cd "${srcdir}/pytools-python2"
  pypy setup.py build
}

package_pypy-pytools-git() {
  depends=('pypy' 'pypy-decorator')
  provides=('pypy-pytools')
  conflicts=('pypy-pytools')
  cd "${srcdir}/pytools-python2"
  pypy setup.py install --root="${pkgdir}" --skip-build --optimize=1
}

package_pypy3-pytools-git(){
  depends=("pypy3>=2.3" "pypy3<=2.4" 'pypy3-decorator')
  provides=('pypy3-pytools')
  conflicts=('pypy3-pytools')
  cd "${srcdir}/pytools"
  # pypy3 setup.py install --root="${pkgdir}" --skip-build --optimize=1 \
  #   --install-lib=/opt/pypy3/lib/python3.2/site-packages
  pypy3 setup.py install --root="${pkgdir}" --skip-build --optimize=1
}
