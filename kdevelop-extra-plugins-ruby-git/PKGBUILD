# Mantainer: mosra <mosra@centrum.cz>

pkgname=(kdevelop-extra-plugins-ruby-git)
pkgver=20110814
pkgrel=1
pkgdesc="Ruby language support for KDevelop - Git build"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
groups=('kde' 'kdevelop-extra-plugins')
depends=('kdevplatform-git')
optdepends=('kdevelop-git')
makedepends=('cmake' 'automoc4' 'git' 'bison')
source=('no-tests.patch')
md5sums=('dc05b31fb4f76af3660469afeec8fc90')

_gitroot="git://anongit.kde.org/kdev-ruby"
_gitname="ruby"

build() {
    cd "$srcdir"
    msg "Connecting to Git server...."

    if [ -d $_gitname ] ; then
        cd $_gitname

        # Revert no-tests.patch
        git checkout .

        git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "Git checkout done or server timeout"
    msg "Starting make..."

    # Don't install half of user's home dir
    cd "$srcdir/$_gitname"
    git apply "$srcdir/no-tests.patch"

    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake ../${_gitname} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="${pkgdir}" install
}
