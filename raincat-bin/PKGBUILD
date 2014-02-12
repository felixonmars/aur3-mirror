# Maintainer: cuihao <cuihao dot leo at gmail dot com>

pkgname=raincat-bin
_pkgname=Raincat
_insdir="opt/${_pkgname}"
pkgver=20140211
pkgrel=1
pkgdesc="A simple but nice game written in Haskell. Guide the fuzzy cat to safety!"
url="http://raincat.bysusanlin.com/"
license=('custom', 'CCPL')
arch=('x86_64' 'i686')
if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-sdl_mixer' 'lib32-sdl_image' 'lib32-freeglut' 'lib32-mesa' 'lib32-glu' 'lib32-libsm' 'lib32-gmp' 'lib32-libxmu')
elif [ "$CARCH" = "i686" ]; then
    depends=('sdl_mixer' 'sdl_image' 'freeglut' 'mesa' 'glu' 'libsm' 'gmp' 'libxmu')
fi
conflicts=('raincat')

source=('http://stage.gamecreation.org/raincat/raincat.linux.tar.gz')
md5sums=('d3a5577238b15404873549bd0da3ce43')

package() {
    cd "${srcdir}/${_pkgname}"

    # data and executable files
    mkdir -p "${pkgdir}/${_insdir}/data"
    cp -rT data "${pkgdir}/${_insdir}/data"
    cp {${_pkgname},readme.txt} "${pkgdir}/${_insdir}"

    cd "${pkgdir}"
    
    # shell script as a wrapper to start the program
    mkdir -p "usr/bin"
    echo -e "#!/bin/sh" >> "usr/bin/raincat"
    echo -e "cd /${_insdir}" >> "usr/bin/raincat"
    echo -e "LD_LIBRARY_PATH+=/${_insdir} exec /${_insdir}/${_pkgname}" \
            >> "usr/bin/raincat"
    chmod a+x "usr/bin/raincat"

    # dependence on old libgmp
    if [ "$CARCH" = "x86_64" ]; then
        ln -s /usr/lib32/libgmp.so "${_insdir}/libgmp.so.3"
    elif [ "$CARCH" = "i686" ]; then
        ln -s /usr/lib/libgmp.so "${_insdir}/libgmp.so.3"
    fi
}
