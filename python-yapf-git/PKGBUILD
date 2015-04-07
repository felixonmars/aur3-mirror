# Maintainer: Tianjiao Yin <ytj000@gmail.com>
pkgname='python-yapf-git'
pkgver=r144.6cd1669
pkgrel=1
pkgdesc="A formatter for Python files"
arch=('any')
url="https://github.com/google/yapf"
license=('Apache')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=("python-yapf")
conflicts=("python-yapf")
source=('yapf::git+https://github.com/google/yapf.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/yapf"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/yapf"
    python setup.py -q install --root="$pkgdir" --optimize=1
}
