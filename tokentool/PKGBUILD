# Maintainer: naelstrof <naelstrof@gmail.com>
pkgname=tokentool
pkgver=1.0.b28
pkgrel=2
pkgdesc="Create quick and simple consistently sized tokens for use with any digital battlemat that can use PNG images."
arch=(any)
url="http://www.rptools.net"
license=('GPL')
depends=('java-runtime')
makedepends=('unzip')
source=(http://www.rptools.net/download/zip/${pkgname}-${pkgver}.zip
        http://www.rptools.net/images/logo/RPTools_Token_Logo_242.png)
md5sums=('5968e8fa84af9979aa07db1f4d0c4993'
         '4cfd2661947eac6333f21768fb4629dd')

# Here we create necessary desktop launch files and pixmaps, while removing windows related files.
prepare() {
    msg "Creating desktop entry..."
    _f="$srcdir/${pkgname}.desktop"
    echo "[Desktop Entry]"                       >  $_f
    echo "Version=$pkgver"                       >> $_f
    echo "Name=Token Tool"                       >> $_f
    echo "GenericName=Token Tool"                >> $_f
    echo "Comment=Generates PNG Game Tokens"     >> $_f
    echo "Exec=/usr/bin/${pkgname}"              >> $_f
    echo "Terminal=false"                        >> $_f
    echo "Icon=${pkgname}"                       >> $_f
    echo "Type=Application"                      >> $_f
    echo "Categories=Game;"                      >> $_f

    msg "Creating executable..."
    # We make the executable cd into a configuration directory before launching. This is so that all configurating files end up there when virtualdaivve runs.
    _f="$srcdir/${pkgname}"
    echo "#!/bin/sh"                                                                >  $_f
    echo 'mkdir -p $HOME/.config/tokentool'                                         >> $_f
    echo 'cd $HOME/.config/tokentool'                                               >> $_f
    echo '$JAVA_HOME/bin/java -jar /usr/share/java/tokentool/tokentool.jar'         >> $_f
    chmod +x $_f

    msg "Removing windows files..."
    mv RPTools_Token_Logo_242.png ${pkgname}.png
    mv ${pkgname}-${pkgver}.jar ${pkgname}.jar
}

# Since it runs on java we don't need to compile anything.
# Here we move the package files into position.
package() {
    mkdir -p                            "$pkgdir/usr/bin"
    cp "$srcdir/${pkgname}"             "$pkgdir/usr/bin"
    mkdir -p                            "$pkgdir/usr/share/pixmaps"
    cp "$srcdir/${pkgname}.png"         "$pkgdir/usr/share/pixmaps"
    mkdir -p                            "$pkgdir/usr/share/java/${pkgname}"
    cp "$srcdir/${pkgname}.jar"         "$pkgdir/usr/share/java/${pkgname}"
    mkdir -p                            "$pkgdir/usr/share/applications"
    cp "$srcdir/${pkgname}.desktop"     "$pkgdir/usr/share/applications"

    # Must copy over libs with it
    cp -R "$srcdir/lib"                 "$pkgdir/usr/share/java/${pkgname}"
}
