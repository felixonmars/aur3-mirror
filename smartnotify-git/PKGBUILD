 # Contributor: sxe <sxxe at gmx dot de>

pkgname=smartnotify-git
_realname=smartnotify
pkgver=20111113
pkgrel=1
pkgdesc="Unobtrusive notifications and job views for your plasma desktop. No more annoying popups. Latest GIT version."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/SmartNotify+(unobtrusive+notifications)?content=133472"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4' 'git')

_gitroot="git://github.com/mbleichner/smartnotify.git"
_gitname="smartnotify"

build() {

    cd "$srcdir"

    # Get rid of old build dirs
    rm -rf $_realname-build
    mkdir $_realname-build

    msg "Connecting to GIT server...."

    if [ -d ${srcdir}/$_realname ] ; then
        cd $_realname && git pull origin master
        msg "Local repository updated."
    else
        git clone $_gitroot $_realname
    fi

    cd "$srcdir"

    cmake $_realname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
    make
    make DESTDIR=$pkgdir install
}
