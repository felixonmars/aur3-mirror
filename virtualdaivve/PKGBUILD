# Maintainer: naelstrof <naelstrof@gmail.com>
pkgname=virtualdaivve
pkgver=1.02.4p2
pkgrel=1
pkgdesc="Virtual Daivve (VD) is a branch of Open Source Universal Gametable (OSU-GT). VD is a Dungeons and Dragons 4E specific virtual tabletop."
arch=(any)
url="http://vd.socalled.org/"
license=('GPL')
depends=('java-runtime')
makedepends=('unzip')
source=(http://www.socalled.org/vd/downloads/ver1/VirtualDaivve.v1.02.4p2.Java-1.6.zip
        http://vd.socalled.org/VD.png)
md5sums=('77c65b238b88cbaa0443a4f9e7bfb0bd'
         '6eae4e8839df770c10642cd20b8ac1e9')

# Here we create necessary desktop launch files and pixmaps, while removing windows related files.
prepare() {
    msg "Creating desktop entry..."
    _f="$srcdir/virtualdaivve.desktop"
    echo "[Desktop Entry]"                      >  $_f
    echo "Version=$pkgver"                      >> $_f
    echo "Name=Virtual Daivve"                  >> $_f
    echo "GenericName=Virtual Daivve"           >> $_f
    echo "Comment=D&D Virtual Desktop Game"     >> $_f
    echo "Exec=/usr/bin/virtualdaivve"          >> $_f
    echo "Terminal=false"                       >> $_f
    echo "Icon=virtualdaivve.png"               >> $_f
    echo "Type=Application"                     >> $_f
    echo "Categories=Game;"                     >> $_f

    msg "Creating executable..."
    # We make the executable cd into a configuration directory before launching. This is so that all configurating files end up there when virtualdaivve runs.
    _f="$srcdir/virtualdaivve"
    echo "#!/bin/sh"                                                                    >  $_f
    echo 'mkdir -p $HOME/.config/virtualdaivve'                                         >> $_f
    echo 'cd $HOME/.config/virtualdaivve'                                               >> $_f
    echo '$JAVA_HOME/bin/java -jar /usr/share/java/virtualdaivve/virtualdaivve.jar'     >> $_f
    chmod +x $_f

    msg "Removing windows files..."
    rm vd.bat
    mv VD.png virtualdaivve.png
    mv VirtualDaivve.jar virtualdaivve.jar
}

# Since it runs on java we don't need to compile anything.
# Here we move the package files into position.
package() {
    mkdir -p                            "$pkgdir/usr/bin"
    cp "$srcdir/virtualdaivve"          "$pkgdir/usr/bin"
    mkdir -p                            "$pkgdir/usr/share/pixmaps"
    cp "$srcdir/virtualdaivve.png"      "$pkgdir/usr/share/pixmaps"
    mkdir -p                            "$pkgdir/usr/share/java/virtualdaivve"
    cp "$srcdir/virtualdaivve.jar"      "$pkgdir/usr/share/java/virtualdaivve"
    mkdir -p                            "$pkgdir/usr/share/applications"
    cp "$srcdir/virtualdaivve.desktop"  "$pkgdir/usr/share/applications"
}
