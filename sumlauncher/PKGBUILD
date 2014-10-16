# Maintainer: naelstrof <naelstrof@gmail.com>
pkgname=sumlauncher
pkgver=3.0.8
pkgrel=2
pkgdesc="SUMLauncher is a tool for managing your overgrowth installation that was created by the members of the Overgrowth community."
arch=("any")
url="http://forums.wolfire.com/viewtopic.php?f=13&t=14201"
license=('GPL')
groups=()
depends=("java-runtime")
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://ogmods.antonriehl.com/utilities/Launcher/builds/SUMLauncher_linux.zip"
        "http://ogmods.antonriehl.com/utilities/logo/SUM_128.png")
noextract=()
md5sums=('64959457daacd9fdf4efef940fbe72ea'
         '5652b8117b082650d126b8ed07445667')

#Requires no build
#build() {
#}

package() {
    cd "$srcdir"

    #Move the main jar to the appropriate directory.
    mkdir -p "$pkgdir/usr/share/java/sumlauncher"
    mv SUMLauncher.jar "$pkgdir/usr/share/java/sumlauncher"

    #Create the shell script to launch the java application.
    mkdir -p "$pkgdir/usr/bin"
    _f="$pkgdir/usr/bin/sumlauncher"
    echo "#!/bin/sh" > $_f
    echo "\"$JAVA_HOME/bin/java\" -jar \"/usr/share/java/sumlauncher/SUMLauncher.jar\"" >> $_f
    chmod +x "$pkgdir/usr/bin/sumlauncher"

    #Create desktop file for easy launching.
    mkdir -p $pkgdir/usr/share/{pixmaps,applications}
    cp SUM_128.png $pkgdir/usr/share/pixmaps/$pkgname.png
    _f="$pkgdir/usr/share/applications/$pkgname.desktop"
    echo "[Desktop Entry]"               >  $_f
    echo "Name=SUMLauncher"              >> $_f
    echo "Comment=$pkgdesc"              >> $_f
    echo "Exec=$pkgname"                 >> $_f
    echo "Icon=$pkgname"                 >> $_f
    echo "Type=Application"              >> $_f
    echo "Categories=Game;ActionGame;"   >> $_f
}
