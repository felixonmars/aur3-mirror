# Maintainer: Daniele Zelante <zeldan at zeldan dot net>

_mingw_w64_ver="1.0"
_mingw_w64_date="20110822" # latest x86_64 with 1.0 stable prefix

_actual_file="mingw-w64-${_mingw_w64_ver}-bin_x86_64-linux_${_mingw_w64_date}.tar.bz2"
_repository="http://downloads.sourceforge.net/project/mingw-w64/Toolchains%20targetting%20Win64/Automated%20Builds/"

epoch=1
pkgname='mingw-w64-bin'
pkgver="${_mingw_w64_ver}_${_mingw_w64_date}"
pkgrel=1
pkgdesc="MinGW Toolchain fork for building Windows x86_64 executables - Automated Builds provided by mingw-w64 upstream"
url="http://mingw-w64.sourceforge.net/"
arch=('x86_64')
license=('GPL')
depends=('bash' 'zlib')
makedepends=('bar')
options=(!strip docs zipman !emptydirs !libtool)
source=(${_actual_file}::${_repository}${_actual_file})
noextract=(${_actual_file})
install=${pkgname}.install


build() {
    echo "Nothing to build."
}

package() {

    (
        mkdir -p "${pkgdir}/opt/mingw_w64"
        cd "${pkgdir}/opt/mingw_w64"
        echo "Extracting files from binary tarball : "
        bar "${SRCDEST}/${_actual_file}" | tar -jx

        # remove wrong permissions
        echo "Fixating permissions on files ... "
        chmod -R a+X,a+r .
        find . -name '*.a' -exec chmod -x {} \;
    )

    (
        mkdir -p "${pkgdir}/usr/bin"
        cd "${pkgdir}/usr/bin"
        find "../../opt/mingw_w64/bin/" -type f -name 'x86_64-w64-mingw32-*' -exec ln -s {} \;
    )

}

md5sums=('a8f9f7648ea9847f4b691c1e032c2ce0')
