# Maintainer: Florian Hahn <flo@fhahn.com>

pkgname=marelle-git
pkgdesc='Test-driven system administration with a little extra logic.'
license=('unknown')
pkgver=0.r97.c88eac0
pkgrel=2
depends=('swi-prolog')
makedepends=('git')
conflicts=()
provides=('marelle')
arch=('i686' 'x86_64')
url=('https://github.com/larsyencken/marelle')
source=('git+https://github.com/larsyencken/marelle.git')
md5sums=('SKIP')
_gitname=marelle

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_gitname}/"
    cat >marelle <<EOF                                            
#!/bin/bash
exec swipl -q -t main -s /usr/share/marelle/marelle.pl "$@"
EOF


    install -Dm755 marelle "${pkgdir}/usr/bin/marelle"
    mkdir -p "${pkgdir}/usr/share/marelle/"
    install -Dm755 *.pl "${pkgdir}/usr/share/marelle/"
}
