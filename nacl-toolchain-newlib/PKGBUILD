# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=nacl-toolchain-newlib
pkgdesc='Native Client is an open-source technology that allows you to build web applications that seamlessly execute native compiled code inside the browser.'
pkgrel=1
pkgver="8989"
binutilsver="2.20.1"
newlibver="1.20.0"
gccver="4.4.3"
arch=('x86_64' 'i686')
depends=('zlib' 'mpfr' )
makedepends=('bison' 'bash')
options=(!strip)
license=('BSD' 'GPL3' 'LGPL3' 'GPL2' 'FDL' 'custom')
url='http://code.google.com/chrome/nativeclient/'
source=(http://mirrors.usc.edu/pub/gnu/binutils/binutils-"${binutilsver}".tar.bz2
        ftp://sources.redhat.com/pub/newlib/newlib-"${newlibver}".tar.gz
        http://mirrors.usc.edu/pub/gnu/gcc/gcc-"${gccver}"/gcc-"${gccver}".tar.bz2
        http://gsdview.appspot.com/nativeclient-archive2/x86_toolchain/r"${pkgver}"/nacltoolchain-buildscripts-r"${pkgver}".tar.gz
        http://gsdview.appspot.com/nativeclient-archive2/x86_toolchain/r"${pkgver}"/naclbinutils-"${binutilsver}"-r"${pkgver}".patch.bz2
        http://gsdview.appspot.com/nativeclient-archive2/x86_toolchain/r"${pkgver}"/naclnewlib-"${newlibver}"-r"${pkgver}".patch.bz2
        http://gsdview.appspot.com/nativeclient-archive2/x86_toolchain/r"${pkgver}"/naclgcc-"${gccver}"-r"${pkgver}".patch.bz2)
md5sums=('9cdfb9d6ec0578c166d3beae5e15c4e5'
         'e5488f545c46287d360e68a801d470e8'
         'fe1ca818fc6d2caeffc9051fe67ff103'
         'f8082adf20ce624f3eb6a9ab9f862b2d'
         'c3d54e4b12e326180c038b2793642d29'
         '038346ad710d7dd4394ab157abda9ab0'
         '6b68e91d20a53eaf3ac21c9df0a9bb9d')

build(){
    mkdir "${srcdir}"/"${pkagename}"/SRC
    mv "${srcdir}"/"${pkagename}"/binutils-"${binutilsver}" "${srcdir}"/"${pkagename}"/SRC/binutils
    mv "${srcdir}"/"${pkagename}"/newlib-"${newlibver}" "${srcdir}"/"${pkagename}"/SRC/newlib
    mv "${srcdir}"/"${pkagename}"/gcc-"${gccver}" "${srcdir}"/"${pkagename}"/SRC/gcc
    msg 'Patching Sources'
    patch -d "${srcdir}"/"${pkagename}"/SRC --silent -p0 -E -R -i naclbinutils-"${binutilsver}"-r"${pkgver}".patch
    patch -d "${srcdir}"/"${pkagename}"/SRC --silent -p0 -E -R -i naclnewlib-"${newlibver}"-r"${pkgver}".patch
    patch -d "${srcdir}"/"${pkagename}"/SRC --silent -p0 -E -R -i naclgcc-"${gccver}"-r"${pkgver}".patch
    msg2 "Done"
    msg 'Go to make sex with your Sweetie, or "Build the Eiffel Tower with chopsticks" (or self-abuse XD), or, or... {insert here "which takes a long time"}... this take a very LONG, LONG TIME'
    make PREFIX="${srcdir}"/build CANNED_REVISION="yes" build-with-newlib
}

package(){
    cd "${srcdir}"/"${pkagename}"
    mkdir "${pkgdir}"/opt/
    cp -R "${srcdir}"/build "${pkgdir}"/opt/"${pkgname}"
}
