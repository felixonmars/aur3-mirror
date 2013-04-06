# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=6rdctl-git
_gitname=6rdctl
pkgver=0.3.606c8e1
pkgrel=1
pkgdesc="6rd Control Tool"
arch=("any")
conflicts=("6rdctl")
provides=("6rdctl")
url="https://github.com/felixonmars/6rdctl"
license=("GPL")
depends=('python' 'python-sh')
source=("git://github.com/felixonmars/6rdctl.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
  install -Dm755 "$srcdir/$_gitname/$_gitname.py" "$pkgdir/usr/bin/$_gitname"
}

# vim:set ts=2 sw=2 et:
