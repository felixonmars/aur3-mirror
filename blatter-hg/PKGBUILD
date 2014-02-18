# Maintainer: Fox Wilson <fwilson at fwilson dot me>
pkgname=blatter-hg
pkgver=r5.f8a01161a8af
pkgrel=1

pkgdesc='A static website generator'
arch=('any')
url='https://bitbucket.org/jek/blatter/overview'
license=('MIT')

depends=('python2')
makedepends=('mercurial')
conflicts=('blatter')
provides=('blatter')

source=('hg+https://bitbucket.org/jek/blatter')

md5sums=('SKIP')

pkgver() {
    cd blatter
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
    cd blatter
    python2 setup.py install --root="$pkgdir"/ --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
