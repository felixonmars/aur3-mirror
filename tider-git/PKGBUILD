# Maintainer: naspeh <naspeh@ya.ru>

pkgname=tider-git
pkgver=0.0.0
pkgrel=3
pkgdesc='Lightweight GTK+ time tracker'
arch=('any')
url='https://github.com/naspeh/tider'
license=('BSD')
depends=('python-cairo' 'python-gobject' 'gtk3')
makedepends=('git')
provides=('tider')
source=("$pkgname"::'git://github.com/naspeh/tider.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    python setup.py build || return 1
    python setup.py install --root=$pkgdir --optimize=1 || return 1
}
