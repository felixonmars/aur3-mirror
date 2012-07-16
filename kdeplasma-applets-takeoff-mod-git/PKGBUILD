pkgname=kdeplasma-applets-takeoff-mod-git
_pkgname=takeoff-mod
pkgver=20120716
pkgrel=2
pkgdesc="Takeoff is a full screen menu inpired in the aspect of Slingshot and the OS X Launchpad menu but adapted to the KDE users in a plasmoid. You can now switch between tabs using CTRL+TAB or CTRL+SHIFT+TAB, to move between items in menu or in search tab using arrow keys."
url="https://github.com/printesoi/takeoff-mod"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4' 'git')
provides=('kdeplasma-addons-applets-takeoff')
conflicts=('kdeplasma-addons-applets-takeoff')
install=takeoff-mod.install

_gitroot="git://github.com/printesoi/${_pkgname}.git"

build() {
    msg "Connecting to git server"

    if [[ -d "${srcdir}/${_pkgname}" ]]; then
        cd  "${srcdir}/${_pkgname}" && git pull || return 1;
        msg "The local files are updated";
    else
        git clone "${_gitroot}" "${_pkgname}" || return 1;
        cd  "${srcdir}/${_pkgname}";
    fi

    msg "Git checkout done or server timeout"

    cd "${srcdir}/${_pkgname}" || return 1;
    if [[ ! -d build ]]; then
        mkdir build;
    fi
    cd build || return 1;

    msg "Starting make..."
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
          .. && make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="${pkgdir}" install
}
