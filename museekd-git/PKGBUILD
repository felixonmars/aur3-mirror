# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=museekd-git
pkgver=20150216
pkgrel=1
pkgdesc="Museek+'s daemon. Museek+ is a fork of Hyriand's C++ daemon/client Soulseek P2P client, with many enhancements."
url="http://www.museek-plus.org/"
depends=('libogg' 'libvorbis' 'libxml++' 'libevent')
optdepends=(
    'pyqt3: musetup-qt script'
    'pygtk: musetup-gtk script'
    'python2: some cli utils'
)
makedepends=('git' 'cmake' 'swig')
license=('GPL2')
arch=('i686' 'x86_64')
source=(
    "${pkgname}::git+https://github.com/eLvErDe/museek-plus"
    'museekd@.service'
)
md5sums=(
    'SKIP'
    '785d5178f387777394b2bc3924311df8'
)
conflicts=(
    'museekd' 'museekplus-svn' 'museek-plus' 'museekd-svn'
    'museekbindings' 'museekbindings-svn'
)
provides=('museekd' 'museekbindings')
replaces=('museekd-svn' 'museekbindings-svn')
install=museekd.install

pkgver() {
    cd ${srcdir}/${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
    cd ${srcdir}/${pkgname}

    # python=>python2
    find . -not -regex '.*/\..*' -type f | xargs perl -i -pe 's{^#!\s*(/usr/bin/env python|/usr/bin/python)$}{#!/usr/bin/python2}'

    # further fixes for python bindings
    sed -i -e "/PythonLibs/s/)/ 2.7)/" Mucipher/PyMucipher/CMakeLists.txt
    sed -i -e "40s/python/python2/" Mucipher/PyMucipher/CMakeLists.txt
    sed -i -e "21s/python/python2/" python-bindings/CMakeLists.txt

    # fix for no -fPIC problem
    sed -i -e "10i\\add_compile_options(-fPIC)" Mucipher/CMakeLists.txt

    # fix for systemd service
    sed -i '139d' "museekd/main.cpp"
    sed -i '138a\   char *home = getenv("HOME"); \
    std::string configPath; \
    if(home != NULL) { \
        configPath = std::string(std::string(home) + "/.museekd/config.xml"); \
    }' "museekd/main.cpp"

    mkdir -p ${srcdir}/${pkgname}/build
    cd ${srcdir}/${pkgname}/build

    cmake -DNO_MUSEEQ=1 -DCLIENTS=1 -DBINDINGS=1 -DPREFIX=/usr ${srcdir}/${pkgname}
    make VERBOSE=1
}

package() {
    cd ${srcdir}/${pkgname}/build

    make DESTDIR="${pkgdir}" install

    cd ..
    install -Dm755 scripts/museekd.rc ${pkgdir}/etc/rc.d/museekd
    install -Dm755 ${srcdir}/museekd@.service ${pkgdir}/usr/lib/systemd/system/museekd@.service
}

# vim:set ts=4 sw=4 et:
