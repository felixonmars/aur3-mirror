# Maintainer: Nicola Lamacchia <nicola dot lamacchia ampersat gmail dot com>
pkgname=pysay-git
pkgver=r12.535b37c
pkgrel=2
pkgdesc="A Python version of cowsay (with a new cow!)"
arch=(any)
url="https://github.com/nicolalamacchia/pysay"
license=('Artistic2.0')
depends=('python')
makedepends=('git')
provides=('pysay')
conflicts=('pysay')
options=(!emptydirs)
source=('git://github.com/nicolalamacchia/pysay.git')
md5sums=('SKIP')

_gitroot=git://github.com/nicolalamacchia/pysay.git
_gitname=pysay

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
# vim:set ts=2 sw=2 et:
