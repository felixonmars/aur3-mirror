# Maintainer: Tianjiao Yin <ytj000@gmail.com>
pkgname='yapf2-git'
pkgver=r144.6cd1669
pkgrel=1
pkgdesc="A formatter for Python2 files"
arch=('any')
url="https://github.com/google/yapf"
license=('Apache')
depends=('python2')
makedepends=('git' 'python2-setuptools')
provides=("yapf2")
conflicts=("yapf2")
source=('yapf::git+https://github.com/google/yapf.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/yapf"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/yapf"
    python2 setup.py -q install --root="$pkgdir" --optimize=1
    mv "$pkgdir/usr/bin/yapf" "$pkgdir/usr/bin/yapf2"
}
