# Maintainer: Maximilian Köhl <linuxmaxi@googlemail.com>
pkgname=python-gtkspellcheck
pkgver=4.0
pkgrel=1
pkgdesc="A simple but quite powerful spellchecking library written in pure Python for Gtk based on Enchant."
arch=(any)
url="http://koehlma.github.com/projects/pygtkspellcheck.html"
license=('GPL')
depends=('python-pyenchant' 'python-gobject')
makedepends=('python-sphinx')
optdepends=('gtk3: gtk 3 bindings'
            'gtk2: gtk 2 bindings')
provides=('python-pylocales')
source=(https://github.com/koehlma/pygtkspellcheck/tarball/v${pkgver})
md5sums=('44da8d279f5e9628a38edb2cad69e8e1')

build() {
    cd koehlma-pygtkspellcheck-*
    python3 setup.py install --root=${pkgdir}
}

