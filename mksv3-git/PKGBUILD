# Maintainer: oslik <oslik@mail.ru>
# Contribtor: skydrome

pkgname="mksv3-git"
_pkgname="${pkgname%-git}"
pkgver=20120731
pkgrel=1
pkgdesc="Advanced all in one code editor"
url="http://hlamer.github.com/mksv3"
arch=('any')
license=('GPLv2')
depends=('python2-pyqt'
         'python2-qscintilla'
         'python2-pyparsing')
optdepends=('python2-pygments: for highlighting Scheme files'
            'python2-markdown: for Markdown preview')
makedepends=()
conflicts=("$_pkgname")
provides=("$_pkgname")

_gitroot="git://github.com/hlamer/${_pkgname}.git"
_gitname="$_pkgname"

build() {
    cd $srcdir
    msg "Connecting to GIT server..."
    if [[ -d ${_gitname} ]]
        then (cd ${_gitname} && git pull origin)
        else git clone --depth 1 ${_gitroot} ${_gitname}
    fi
    msg "GIT checkout done or server timeout"

    cd ${srcdir}/${_gitname}
    python2 setup.py build || exit 1
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
