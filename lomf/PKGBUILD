pkgname=lomf
pkgver=5.2
pkgrel=1
pkgdesc="Less Overhead More Fun - programming language / IDE for CS education"
url="http://ux-02.ha.bib.de/daten/Löwe/Programmierung/LOMF/"
license=('custom')
depends=('java-runtime')
arch=('any')
source=("http://ux-02.ha.bib.de/daten/Löwe/Programmierung/LOMF/lomf${pkgver}.jar"
\
'lomf.desktop' 'icon.png' 'lomf.launcher')

md5sums=('32079b2e773477f48d3df162c91befe9'
         '75e019b70ed6470dac8638def0d5cfdc'
         '38f721ad051dbe78eba15cc906b71230'
         '96e71dcf3fefa7b477b7d13f8379ab9a')

  build() {
    cd ${srcdir}

    # Create Destination Directories
    install -d ${pkgdir}/{usr/bin/,opt/lomf/}

    # Install program
    install -D -m644 ${srcdir}/lomf${pkgver}.jar \
        ${pkgdir}/opt/lomf/lomf.jar

    # Install Desktop File
    install -D -m644 $srcdir/lomf.desktop \
        ${pkgdir}/usr/share/applications/lomf.desktop

    # Install Icon File
    install -D -m644 $srcdir/icon.png \
        ${pkgdir}/usr/share/pixmaps/lomf.png

    # Install Client Launcher
    install -D -m755 $srcdir/lomf.launcher \
        ${pkgdir}/usr/bin/lomf
}
# vim:set ts=2 sw=2 et:

