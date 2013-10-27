# Maintainer: naspeh <naspeh@ya.ru>

pkgname=tider-git
pkgver=alfa
pkgrel=1
pkgdesc='Lightweight GTK+ time tracker'
arch=('any')
url='https://github.com/naspeh/tider'
license=('BSD')
depends=('python-cairo' 'python-gobject' 'gtk3')
provides=('tider')
source=('https://github.com/naspeh/tider/archive/master.zip')
sha256sums=('SKIP')

build() {
    cd "$srcdir/tider-master"
    python setup.py build || return 1
    python setup.py install --root=$pkgdir --optimize=1 || return 1
}
