# Maintainer: Dmitry Shintyakov <shintyakov@gmail.com>

pkgname=pick-geometry-git
pkgver=1.0.r8.g5da1f6b
pkgver() {
  cd "$srcdir/$pkgname"
  if ! git describe --tags 2>/dev/null; then
    echo "1.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
  fi | sed 's/-/.r/; s/-/./g'
}
pkgrel=1
pkgdesc="GUI tool to query location on an image from user"
url="https://github.com/dmishin/pick-geometry/"
depends=('python' 'python-pillow' 'tk')
optdepends=('ffmpeg: video support')
makedepends=('python-distribute' 'git')
license=('MIT')
arch=('any')
source=("$pkgname::git+https://github.com/dmishin/pick-geometry.git")
md5sums=(SKIP)
provides=(pick-geometry)
conflicts=()
replaces=()

build() {
  cd "$srcdir/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}