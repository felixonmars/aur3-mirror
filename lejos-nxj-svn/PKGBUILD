# Maintainer: Zack Buhman <zack@buhman.org>

pkgname=lejos-nxj-svn
pkgver=6954
pkgrel=1
pkgdesc="A firmware replacement and toolchain for programming the Lego NXT in Java"
arch=('i686' 'x86_64')
url="http://lejos.sourceforge.net/"
license=('MPL' 'GPL' 'APACHE')
url="http://lejos.sourceforge.net/"
depends=('java-environment' 'java-runtime' 'bluez' 'libusb-compat'
         'java-bluecove' 'java-commons-cli' 'java-bcel' 'lego-udev-rules')
makedepends=('apache-ant' 'unzip' 'subversion')
conflicts=('lejos-nxj')
source=('svn://svn.code.sf.net/p/lejos/code/trunk' 'jlibnxt.patch')
md5sums=('SKIP' '5312d4df61acacbbd2db4fcae9a3c8fc')

build() {

    cd "${srcdir}/trunk/release"
    ant dist.unix #FIXME: this builds extraneous windows stuff

    cd "${srcdir}/trunk/release/build/bin_unix/build"
    patch -p1 -uN -i "${srcdir}/jlibnxt.patch"
    ant
}

package() {

    rm -rf "${pkgdir}/"*

    _srcdir="${srcdir}/trunk/release"
    _pkgdir="${pkgdir}/opt/lejos-nxj"

    install -d -m755 "${_pkgdir}/"{bin,lib}
    install -d -m755 "${_pkgdir}/lib/"{nxt,pc}
    install -d -m755 "${_pkgdir}/lib/pc/3rdparty"
    install -d -m755 "${_pkgdir}/lib/pc/native/linux/x86_64"

    install -m644 -t "${_pkgdir}/bin" "${_srcdir}/build/bin_shared/bin/"*
    install -m755 -t "${_pkgdir}/bin" "${_srcdir}/build/bin_unix/bin/"nxj*

    ln -s /usr/share/java/bcel.jar "${_pkgdir}/lib/pc/3rdparty"
    ln -s /usr/share/java/bluecove/bluecove-gpl.jar "${_pkgdir}/lib/pc/3rdparty"
    ln -s /usr/share/java/bluecove/bluecove.jar "${_pkgdir}/lib/pc/3rdparty"
    ln -s /usr/share/java/commons-cli/commons-cli.jar "${_pkgdir}/lib/pc/3rdparty"

    install -m644 -t "${_pkgdir}/lib/pc/3rdparty" \
        "${_srcdir}/build/bin_shared/lib/pc/3rdparty/"{jcommon.jar,jfreechart.jar,stax-api-1.0.1.jar}
    install -m644 -t "${_pkgdir}/lib/pc" "${_srcdir}/build/bin_shared/lib/pc/"*.jar
    install -m644 -t "${_pkgdir}/lib/pc/native/linux/x86_64" \
        "${_srcdir}/build/bin_unix/lib/pc/native/linux/x86_64/libjlibnxt.so"
    install -m644 -t "${_pkgdir}/lib/nxt" \
        "${_srcdir}/build/bin_shared/lib/nxt/classes.jar"

    unzip "${_srcdir}/build/bin_shared/samples.zip" -d "${_pkgdir}"

    install -d -m755 "${pkgdir}/usr/bin"
    cd "${_pkgdir}/bin"
    for i in nxj*; do ln -sf "${_pkgdir}/bin/$i" "${pkgdir}/usr/bin"; done
}
