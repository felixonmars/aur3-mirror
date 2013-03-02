pkgname=python2-fitz
pkgver=20130301
pkgrel=1
pkgdesc="Python bindings for MuPDF's rendering library"
arch=('any')
url='https://github.com/rk700/python-fitz'
license=('GPL3')
depends=('python2' 'mupdf>=1.2')
_gitroot="git://github.com/rk700/python-fitz"
_gitname="python-fitz"

build() {
    cd "${srcdir}"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

	python2 setup.py build
}

package() {
    cd "$srcdir/$_gitname-build"
	python2 setup.py install --root="${pkgdir}" --skip-build -O2
}
#vim:set ts=4 sw=4 et:
