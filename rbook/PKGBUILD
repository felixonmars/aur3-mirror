pkgname=rbook
pkgver=20130301
pkgrel=1
pkgdesc='Vim style document viewer'
arch=('any')
url='https://github.com/rk700/rbook'
license=('GPL3')
depends=('python2' 'wxpython' 'python2-fitz')
optdepends=('python-djvulibre: DJVU documents support'
            'python2-epub: EPUB documents support')
_gitroot="git://github.com/rk700/rbook"
_gitname="rbook"

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

	sed -i 's|/usr/bin/env python|/usr/bin/env python2|' bin/rbook
	python2 setup.py build
}

package() {
    cd "$srcdir/$_gitname-build"
	python2 setup.py install --root="${pkgdir}" -O2
}
#vim:set ts=4 sw=4 et:
