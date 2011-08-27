# Contributor: mosra <mosra@centrum.cz>

pkgname=(kdevelop-extra-plugins-php-docs-git)
pkgver=20110604
pkgrel=1
pkgdesc="A PHP documentation plugin for KDevelop - GIT build"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
groups=('kde' 'kdevelop-extra-plugins')
depends=('kdevplatform-git')
optdepends=('kdevelop-git')
makedepends=('cmake' 'automoc4' 'git')
provides=('kdevelop-php-docs')
conflicts=('kdevelop-php-docs')
source=()
md5sums=()

_gitroot="git://anongit.kde.org/kdev-php-docs"
_gitname="php-docs"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname

        # Changre remote url to anongit
        if [ -z "$(git remote -v | grep anongit)" ] ; then
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
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_BUILD_TYPE=RELWITHDEBINFO \
        -DCMAKE_{SHARED,MODULE,EXE}_LINKER_FLAGS='-Wl,--no-undefined -Wl,--as-needed' \
        -DCMAKE_INSTALL_PREFIX=/usr

    make
}

package() {
    cd "$srcdir/build"

    make DESTDIR="${pkgdir}" install
}
