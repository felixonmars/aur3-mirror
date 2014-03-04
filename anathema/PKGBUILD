# Contributor: Travis Willard <travisw@wmpub.ca>
# Contributor: Fernando Lagos <fernando@zerial.org>


pkgname=anathema
pkgver=5.1.3
pkgrel=1
pkgdesc="An Exalted toolkit, offering basic character generation & campaign management functions."
url="http://anathema.sourceforge.net"
license="GPL"
depends=('j2re>=1.5')
arch=('any')
md5sums=('426de227cea19de49d05cdefcb7a5dcb')
source=(http://anathema.butatopanto.de:8081/full/5.1.3/Anathema_Zip_v5.1.3.zip)
#source=("http://downloads.sourceforge.net/project/anathema/Anathema%20${pkgver}%20Calibration/Anathema_v${pkgver}.zip" \
#        "${pkgname}.launcher" "${pkgname}.desktop" anathema.png)

build() {
    cd $startdir/src

    install -d -m 755 $startdir/pkg/usr/share/{applications,pixmaps} 

    # Install executible script that sets repo dir to $HOME/.anathema/repository
    install -D -m 755 anathema.launcher $startdir/pkg/usr/bin/anathema

    # Convert and install icon into /usr/share/pixmaps
    #icoconvert anathema.ico
    install -D -m 644 anathema.png $startdir/pkg/usr/share/pixmaps/anathema.png

    # Install .desktop file
    install -D -m 644 anathema.desktop $startdir/pkg/usr/share/applications/anathema.desktop

    # Install .jars into /usr/share/java/anathema as per Java packaging spec
    install -d -m 755 $startdir/pkg/usr/share/java/anathema/lib $startdir/pkg/usr/share/java/anathema/plugins
    install -D -m 644 anathema.jar $startdir/pkg/usr/share/java/anathema/anathema.jar
    install -D -m 644 lib/* $startdir/pkg/usr/share/java/anathema/lib
    install -D -m 644 plugins/* $startdir/pkg/usr/share/java/anathema/plugins
}
