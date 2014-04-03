# Maintainer: Prurigro

_pkgname=gitsubmodule
pkgname=${_pkgname}-git
pkgver=2bc9554
pkgrel=1
pkgdesc="Complementary script to the git submodule providing easy update and remove"
arch=('any')
url="http://artmees.github.io/gitsubmodule/"
license=('GPL2')
depends=('git')
source=("git://github.com/artmees/gitsubmodule.git")
sha512sums=('SKIP')

pkgver(){
    cd $_pkgname

    ## Set the package version from the git repo we just cloned or pulled
    git describe --always | sed 's|-|.|g;s|[^\.]*\.||;s|\.[^\.]*$||'
}

prepare(){
    cd $_pkgname
    gzip gitsubmodule_man
}

package(){
    cd $_pkgname
    install -Dm755 gitsubmodule "${pkgdir}/usr/bin/gitsubmodule"
    install -Dm644 gitsubmodule_man.gz "${pkgdir}/usr/share/man/man1/gitsubmodule.1.gz"
}
