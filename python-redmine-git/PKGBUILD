# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Mattias Giese <lc-archlinux@s99.be>
pkgname=python-redmine-git
pkgver=v1.1.1.r0.gf52d104
pkgrel=1
pkgdesc="Library for communicating with a Redmine project management application"
arch=('any')
url="https://github.com/maxtepkeev/python-redmine"
license=('Apache2')
groups=()
depends=('python' 'python-requests')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=()
md5sums=()

_gitroot='https://github.com/maxtepkeev/python-redmine.git'
_gitname=python-redmine

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
  python setup.py install --root="$pkgdir/" --optimize=1
}

pkgver() {
  cd "$srcdir/$_gitname-build"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# vim:set ts=2 sw=2 et:
