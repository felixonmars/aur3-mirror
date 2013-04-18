# Maintainer: tailinchu <use_my_id at gmail dot com>

pkgname=ranger-python2-git
pkgver=v1.6.0.111.g63b6a82
pkgrel=1
pkgdesc="A simple, vim-like file manager (git version)"
arch=('any')
url="http://github.com/hut/ranger"
license=('GPL')
depends=('python2')
makedepends=('git')
conflicts=('ranger')
provides=('ranger')
source=("git://github.com/hut/ranger.git")
md5sums=('SKIP')

_gitroot="ranger"

pkgver () {
    cd "$srcdir/$_gitroot"
    git describe --always | sed 's|-|.|g' 
}

package() {
    cd "$srcdir/$_gitroot"
    python2 setup.py -q install --root="${pkgdir}" --optimize=1
}

