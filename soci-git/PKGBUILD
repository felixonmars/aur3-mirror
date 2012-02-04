# Maintainer: Mika Fischer <mika.fischer@zoopnet.de>
pkgname=soci-git
pkgver=20120109
pkgrel=1
pkgdesc="Database access library for C++"
arch=('i686' 'x86_64')
url="http://soci.sf.net"
license=('custom:boost')
depends=('gcc-libs')
makedepends=('cmake' 'libmysqlclient' 'postgresql-libs' 'sqlite3' 'unixodbc')
optdepends=('instantclient-basic: support for oracle databases'
            'libmysqlclient: support for mysql databases'
            'postgresql-libs: support for postgresql databases'
            'sqlite3: support for sqlite databases'
            'unixodbc: support for ODBC databases')
provides=('soci')
conflicts=('soci')

_gitroot='git://soci.git.sourceforge.net/gitroot/soci/soci'
_gitname='soci'

build() {
    cd "${srcdir}"
    msg "Connecting to GIT server..."
    if [ -d "${_gitname}" ]; then
        cd "${_gitname}" && git pull origin master
        msg "The local files are updated."
    else
        git clone "${_gitroot}" "${_gitname}"
    fi
    GIT_DIR="${srcdir}/${_gitname}/.git" git checkout master
    msg "GIT checkout done or server timeout"

    msg "Starting build..."
    rm -rf "${srcdir}/${_gitname}-build"
    mkdir -p "${srcdir}/${_gitname}-build"
    cd "${srcdir}/${_gitname}-build"
    cmake \
        -DSOCI_TESTS=OFF \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        "${srcdir}/${_gitname}/src"
    make
}

package() {
    cd "${srcdir}/${_gitname}-build"
    make DESTDIR="${pkgdir}" install

    # For some reason -DLIBDIR=lib causes libsoci_empty.so to disappear
    if [ -e "${pkgdir}/usr/lib64" ]; then
        mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
    fi
    install -Dm0644 "${srcdir}/${_gitname}/src/LICENSE_1_0.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
