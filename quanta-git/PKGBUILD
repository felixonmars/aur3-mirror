# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: mosra <mosra@centrum.cz>

pkgname=quanta-git
pkgver=20121027
pkgrel=1
pkgdesc="An IDE for Web Development based on the KDevelop Platform - Git version"
arch=('i686' 'x86_64')
url="http://quanta.kdewebdev.org/"
license=('GPL')
depends=('kdevplatform-git')
optdepends=('qjson' 'kdevelop-pg-qt-git')
makedepends=('cmake' 'automoc4' 'git' 'flex')
provides=('quanta')
replaces=('quanta')
conflicts=('quanta')

_gitroot="git://anongit.kde.org/quanta"
_gitname="quanta"

build() {
    cd "${srcdir}"

    msg "Connecting to the Git server..."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "Git checkout done."
    msg "Starting make..."

    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"

    cmake ../${_gitname} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release

    make
}

package() {
    cd "${srcdir}/build"

    make DESTDIR="${pkgdir}" install
}
