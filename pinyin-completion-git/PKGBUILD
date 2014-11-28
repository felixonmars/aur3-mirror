pkgname=pinyin-completion-git
pkgver=30.48dd34c
pkgrel=1
pkgdesc="complete path name based upon the pinyin acronym of Chinese characters"
arch=('any')
url="https://github.com/adaptee/pinyin-completion"
license=('MIT')
depends=('python2')
makedepends=('git')
source=("git+https://github.com/adaptee/pinyin-completion"
        "pinyin-completion-git.install")
sha256sums=('SKIP'
            '561d9d22c02d694050a0781c3b6e86aea6d8356d23cd88c558cb48453de03ea6')
install='pinyin-completion-git.install'
_gitname='pinyin-completion'

pkgver() {
    cd $_gitname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$srcdir/$_gitname/tools"
    python2 table-generator.py > ../pinyin/pinyin_initial.py
}

package() {
    cd $_gitname

    sed -i -r "s|^#!/usr/bin/env python|#!/usr/bin/env python2|" setup.py pinyin-comp tools/*.py pinyin/*.py

    mkdir -p "$pkgdir/usr/share/$pkgname/"
    cp -r shell "$pkgdir/usr/share/$pkgname/"
    cp -r tools "$pkgdir/usr/share/$pkgname/"

    python2 setup.py install --root=$pkgdir/ --optimize=1
}
