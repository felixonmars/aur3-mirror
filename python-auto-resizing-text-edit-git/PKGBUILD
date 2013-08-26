# Maintainer: Kamil Śliwak <cameel2/at/gmail/com>
_realname=auto-resizing-text-edit
_realver=0.1.0
pkgname=python-$_realname-git
pkgver=0d72210
pkgrel=2
pkgdesc="A Qt widget based on QTextEdit, that changes its height automatically to accommodate the text"
arch=('any')
url="https://github.com/cameel/$_realname"
license=('MIT')
depends=('python' 'python-pyqt5')
makedepends=('python-setuptools' 'git')
conflicts=('python-auto-resizing-text-edit')
options=(!emptydirs)
source=("git+https://github.com/cameel/${_realname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$SRCDEST/$_realname"

    # Remove leading 'v' if present
    # Use both annotated and non-annotated tags
    git describe --tag | sed 's|-|.|g' | sed 's|^v||g'
}

package() {
    cd "$srcdir/$_realname"
    python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=4 sw=4 et:
