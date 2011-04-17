# Contributor: Frank Scheffold <fscheffold(at)gmail.com>


pkgname=akonadi-facebook-git
pkgver=20110417
pkgrel=1
pkgdesc="Makes events, contacts, notes and messages from Facebook available in KDE."
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/pim/akonadi-facebook/"
license=('GPL')
depends=('kdelibs' 'boost-libs' 'akonadi')
makedepends=('cmake' 'automoc4' 'boost' 'git')
source=()
md5sums=()

_gitroot="git://anongit.kde.org/akonadi-facebook"
_gitname="akonadi-facebook"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname

        # Change remote url to anongit
        if [ -z $(git branch -v | grep anongit) ] ; then
            git remote set-url origin ${_gitroot}
        fi

        git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake ../${_gitname} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RELWITHDEBINFO

    make || return 1
    make DESTDIR=${pkgdir} install || return 1
}
