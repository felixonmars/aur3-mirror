# Maintainer: Remco van der Zon <theunknowncylon at live . nl>

pkgname=python-pypng-git
pkgver=20130102
pkgrel=1
pkgdesc='PyPNG provides Python code for encoding/decoding PNG files.'
arch=('any')
url="https://github.com/drj11/pypng/"
license=('MIT')
depends=('python')
makedepends=('git' 'python-distribute')
provides=('python3-pypng')
conflicts=('python3-pypng')
_gitroot='git://github.com/drj11/pypng.git'
_gitname='python-pypng'

build() {
    cd "$srcdir"
    if [ -d "$_gitname" ] ; then
        cd "$_gitname" && git pull origin
    else
        git clone "$_gitroot" "$_gitname"
    fi
}

package() {
    cd "$srcdir/$_gitname"
    python setup.py install --root="${pkgdir}" --optimize=1
}
