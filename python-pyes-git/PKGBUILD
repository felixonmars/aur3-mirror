# Maintainer: kang <kang@insecure.ws>
pkgname=python-pyes-git
pkgver=1
pkgrel=1
pkgdesc="Python connector for ElasticSearch - the pythonic way to use ElasticSearch"
arch=(x86_64 i386)
url="https://github.com/aparo/pyes"
license=('BSD')
depends=('python' 'python-six' 'python-urllib3')
makedepends=('git')
source=()

_gitroot=https://github.com/aparo/pyes
_gitname=pyes

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
}

package() {
  #cd "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$_gitname-build"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
