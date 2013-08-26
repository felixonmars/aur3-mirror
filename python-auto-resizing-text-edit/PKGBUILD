# Maintainer: Kamil Śliwak <cameel2/at/gmail/com>
_realname=auto-resizing-text-edit
pkgname=python-$_realname
pkgver=0.1.0
pkgrel=2
pkgdesc="A Qt widget based on QTextEdit, that changes its height automatically to accommodate the text"
arch=('any')
url="https://github.com/cameel/$_realname"
license=('MIT')
depends=('python' 'python-pyqt5')
makedepends=('python-setuptools')
conflicts=('python-auto-resizing-text-edit-git')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/a/${_realname}/${_realname}-${pkgver}.tar.gz")
md5sums=('7df271daee9553af8cdc5ac3b377b3d2')

package() {
    cd "$srcdir/$_realname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=4 sw=4 et:
