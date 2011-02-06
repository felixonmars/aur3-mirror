# Contributor: Travis Willard <travisw@wmpub.ca>

pkgname=anathema
pkgver=r3
pkgrel=1
pkgdesc="An Exalted toolkit, offering basic character generation & campaign management functions."
url="http://anathema.sourceforge.net"
license="GPL"
depends=('j2re>=1.5')
arch=('i686')
md5sums=('a80de965ed600740e05f8f3fb8249b81'
         'a4b12673543de2566350c0ee0ca031f8'
         '7e2ee61a30f567881649cad9ab18c98f'
         '72585482a64a1027796b0195c122e15d')
source=("http://downloads.sourceforge.net/project/anathema/Outcaste/Release%203/${pkgname}_outcaste_${pkgver}.zip" \
        "${pkgname}.launcher" "${pkgname}.desktop" anathema.png)

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
