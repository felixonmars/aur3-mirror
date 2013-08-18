# Maintainer: Christoph Haag <haagch@studi.informatik.uni-stuttgart.de>

# I'm not really sure about what I'm doing here.

_mingw_w64_ver="1.0"
_mingw_w64_date="20130523" # latest i686

_actual_file="mingw-w64-bin_i686-linux_${_mingw_w64_date}.tar.bz2"
_repository="http://downloads.sourceforge.net/project/mingw-w64/Toolchains%20targetting%20Win64/Automated%20Builds/"

epoch=1
pkgname='mingw-w64-bin_i686'
pkgver="${_mingw_w64_ver}_${_mingw_w64_date}"
pkgrel=1
pkgdesc="MinGW Toolchain fork for building Windows i686? executables - Automated Builds provided by mingw-w64 upstream"
url="http://mingw-w64.sourceforge.net/"
arch=('x86_64' 'i686')
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
        mkdir -p "${pkgdir}/opt/mingw_w64_i686"
        cd "${pkgdir}/opt/mingw_w64_i686"
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
        #UGLY
        find "../../opt/mingw_w64_i686/bin/" -type f -name 'x86_64-w64-mingw32-*' | while read i; do
                ln -s "$i" $(echo $(basename "$i") | sed "s/x86_64-/i686-/g")
        done
    )

}

md5sums=('50ab74d7f9ac7eeb2c8b8420aba6a1d7')
