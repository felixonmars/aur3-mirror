# Maintainer: Falmarri <psychicsurgeon@gmail com>

pkgname=gitflow-gerrit-git
pkgver=20141016
pkgrel=1
pkgdesc="Git extensions to provide high-level repository operations for Vincent Driessen's branching model. Forked to include support for gerrit code reviews"
arch=('any')
url="https://github.com/soboko/gitflow"
license=('BSD')
depends=('git')
source=(git://github.com/soboko/gitflow.git)
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/gitflow
    git describe --tags | sed 's/-/./g'
}

prepare() {
    cd ${srcdir}/gitflow

    git submodule init
    git submodule update
    msg "Submodule checkout done or server timeout"
}

package() {
    msg "Starting packaging"

    cd ${srcdir}/gitflow
    make prefix=/${pkgdir}/usr install

    install -Dm644 ${srcdir}/gitflow/LICENSE \
            ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
