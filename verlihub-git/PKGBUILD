# Maintainer: Siddhartha Sahu <sh.siddhartha@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

_pkgname=verlihub
pkgname=$_pkgname-git
pkgver=1.0.r10.1035cf6
pkgrel=1
pkgdesc="A DC++ protocol server (hub) - GIT version"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.verlihub-project.org/"
depends=('geoip' 'mariadb' 'gettext' 'pcre' 'zlib' 'openssl')
makedepends=('git' 'cmake' 'lua51' 'python2')
optdepends=('lua51: for Lua plugins'
            'python2: for Python plugins')
conflicts=('verlihub')
provides=('verlihub')
install=$_pkgname.install
source=('git+https://github.com/VerliHub/verlihub-1.0.0.git'
        'verlihub.service')
md5sums=('SKIP'
         '5796a52003035027bb4976150f658c0a')

pkgver() {
    cd "$srcdir/$_pkgname-1.0.0"
    echo "1.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake ../$_pkgname-1.0.0 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DPYTHON_LIBRARY="/usr/lib/libpython2.7.so.1.0" \
        -DPYTHON_INCLUDE_DIR="/usr/include/python2.7"
    make
}

package() {
    cd "$srcdir/build"

    make DESTDIR="${pkgdir}" install

    install -m755 -d "${pkgdir}/usr/lib/systemd/system"
    install -m644 "${srcdir}/verlihub.service" "${pkgdir}/usr/lib/systemd/system/"
}
