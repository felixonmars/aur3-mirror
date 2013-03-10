# Maintainer TheWaffleGuy <gvxq@hotmail.com>
# Contributor: TDY <tdy@gmx.com>

pkgname=cabaretstage
pkgver=6.0.2
pkgrel=2
pkgdesc="A powerful, flexible PDF suite"
arch=('i686' 'x86_64')
url="http://www.cabaret-solutions.com"
license=('custom')
depends=('desktop-file-utils' 'gtk2' 'java-environment')
optdepends=('cups: for printing support')
install=$pkgname.install
source=("http://www.cabaret-solutions.com/system/files/${pkgname}_${pkgver}_linux-64bit.tar_.gz"
        "${pkgname}.desktop"
        "${pkgname}")
md5sums=('116b38c65fd7b513279dd26c2a6164ea'
         '930faa7f427bac6e75c3576e7ebc751a'
         'ac41fdba0fef1f05c455d976b00570d9')
_libarch=amd64
if [[ $CARCH = i686 ]] ; then
    source[0]="http://www.cabaret-solutions.com/system/files/${pkgname}_${pkgver}_linux-32bit.tar_.gz"
    md5sums[0]='436d8dd099aec11eba600acdd9c5fabf'
    _libarch=i386
fi

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -dm755 ${pkgdir}/usr/{{share/{licenses/,java/,doc/,},lib/}${pkgname}/,bin/}
    install -dm755 ${pkgdir}/usr/share/pixmaps/
    find lib -maxdepth 1 -type f -name "*.jar" -exec cp \{\} \
        ${pkgdir}/usr/share/java/${pkgname} \;
    cp lib/${_libarch}/* ${pkgdir}/usr/lib/${pkgname}
    cp -r doc/* ${pkgdir}/usr/share/doc/${pkgname}
    cp cabaret.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
    cp -r demo ${pkgdir}/usr/share/${pkgname}
    #cp -r certificates ${pkgdir}/usr/share/${pkgname}
    #cp -r sdk ${pkgdir}/usr/share/${pkgname}
    cp -r scripts ${pkgdir}/usr/share/${pkgname}
    cp -r instruments ${pkgdir}/usr/share/${pkgname}
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 ../${pkgname}.desktop \
        ${pkgdir}/usr/share/applications/${pkgname}.desktop
    cd ${pkgdir}/usr/share/licenses/${pkgname}
    ln -s /usr/share/doc/${pkgname}/en/EULA.pdf .
}
