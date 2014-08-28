pkgname=fhdwclient
pkgver=8.0
pkgrel=1
pkgdesc="FHDW grade system client"
url="http://ux-02.ha.bib.de/daten/FHDW-Verwaltung/FHDWApplication/"
license=('custom')
depends=('java-runtime')
arch=('any')
source=("${url}fhdwverwClient${pkgver}.jar"
\
'fhdwclient.desktop' 'icon.png' 'fhdwclient.launcher')

md5sums=('80d371041e16203b9efb3fd877c455c5'
         '0bd3c3fb2fa3cb2d2cdd65a600a20686'
                  '792b3e58168ccc21f3e1e30cc2440492'
                           'b26a68ed7c4d1893c32261428f64b1fc')

  package() {
    cd ${srcdir}

    # Create Destination Directories
    install -d ${pkgdir}/{usr/bin/,opt/${pkgname}/}

    # Install program
    install -D -m644 ${srcdir}/fhdwverwClient${pkgver}.jar \
        ${pkgdir}/opt/${pkgname}/${pkgname}.jar

    # Install Desktop File
    install -D -m644 $srcdir/${pkgname}.desktop \
        ${pkgdir}/usr/share/applications/${pkgname}.desktop

    # Install Icon File
    install -D -m644 $srcdir/icon.png \
        ${pkgdir}/usr/share/pixmaps/${pkgname}.png

    # Install Client Launcher
    install -D -m755 $srcdir/${pkgname}.launcher \
        ${pkgdir}/usr/bin/${pkgname}
}
# vim:set ts=2 sw=2 et:

