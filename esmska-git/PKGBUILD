# Maintainer: David Watzke <david@watzke.cz>
# Contributor: Ljukee <lukas.ryc@gmail.com>

_name=esmska
pkgname=esmska-git
pkgver=1.9
pkgrel=1
pkgdesc="Program for sending SMS over the Internet - the latest git version"
arch=('any')
url="http://esmska.googlecode.com/"
license=('AGPL')
depends=('java-runtime' 'apache-ant')
conficts=('esmska' 'esmska-unstable')
provides=('esmska')
install=esmska.install
source=("git://github.com/kparal/esmska.git")
md5sums=('SKIP')

build() {
    return 0
}

package() {
    cp "${srcdir}/../$_name.desktop" "${srcdir}"
    cd "${srcdir}/$_name"
    
    ant clean jar

    install -d "${pkgdir}/usr/share/java/$_name"
    cp -a ${srcdir}/$_name/dist/* "${pkgdir}/usr/share/java/$_name"

    #.desktop + icon files
    install -D -m644 "${srcdir}/$_name.desktop" \
        "${pkgdir}/usr/share/applications/$_name.desktop"
        
    install -d "${pkgdir}/usr/share/pixmaps"
    
    install -D -m644 ${srcdir}/$_name/dist/icons/* \
        "${pkgdir}/usr/share/pixmaps"

    #executable file
    install -d -m755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/java/$_name/$_name.sh" \
        "${pkgdir}/usr/bin/$_name"

    #license
    install -D -m644 ${srcdir}/$_name/dist/license/license.txt \
        ${pkgdir}/usr/share/licenses/$_name/LICENSE
    install -D -m644 ${srcdir}/$_name/dist/license/gnu-agpl.txt \
        ${pkgdir}/usr/share/licenses/$_name/AGPL

    #removing unneeded
    rm ${pkgdir}/usr/share/java/$_name/$_name.exe
}
