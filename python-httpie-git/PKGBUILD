# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Weißschuh <thomas_weissschuh lavabit com>

pkgname=python-httpie-git
pkgver=20120828
pkgrel=1
pkgdesc="cURL for humans"
url="https://github.com/jkbr/httpie"
depends=('python-requests'
         'python-pygments')
makedepends=('python-distribute' 'git')
license=('BSD')
arch=('any')

_gitroot=git://github.com/jkbr/httpie.git
_gitname=httpie
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

  python3 setup.py build

}

package() {
  cd "$srcdir/$_gitname-build"
  python3 setup.py install --root="$pkgdir" --optimize=1
}
