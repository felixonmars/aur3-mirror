# Maintainer: Kevin Woods <woods.k@live.com>

pkgname=groovejaar
pkgver=1.0.22_5_g2705_mod
pkgrel=2
pkgdesc="A Java based client for the GrooveShark service"
arch=('i686' 'x86_64')
url="http://code.google.com/p/groovejaar/"
license=('GPL')
depends=('apache-ant' 'bash' 'jdk7-openjdk' 'jre7-openjdk')
install='groovejaar.install'
source=("https://github.com/Ale46/groovejaar/zipball/master"
        "groovejaar.sh"
        "groovejaar.desktop"
        "groovejaar.png"
        "groovejaar.install"
        "token.properties")
md5sums=('1202af52e720e4e0899e1720da0c449c'
         'bef60f8200cf4cb6dc29b62c6f4afae9'
         '232c371a0f7b6b377c92db29fc9dc328'
         '1488548ff7c25defdde52461cff70aa5'
         'f1b642d359f7f4ed333101165c298595'
         '131820315124eb1d3b54af992e28e0b3')

build() {
    # Compile with apache-ant
    ant -f $srcdir/Ale46-groovejaar-e4431a2/build.xml
}

package() {
    # Install .jar file
    mkdir -p $pkgdir/usr/share/java/groovejaar
    install -D -m 644 $srcdir/Ale46-groovejaar-e4431a2/groovejaar.jar $pkgdir/usr/share/java/groovejaar/GrooveJaar.jar
  
    # Install config and token files
    mkdir -p $pkgdir/home/$USER/.groovejaar
    install -D -m 644 $srcdir/Ale46-groovejaar-e4431a2/config.properties $pkgdir/home/$USER/.groovejaar/config.properties
    install -D -m 644 $srcdir/token.properties $pkgdir/home/$USER/.groovejaar/token.properties
    chown -R $USER $pkgdir/home/$USER/.groovejaar

    # Install launcher script
    install -D -m 755 $srcdir/groovejaar.sh $pkgdir/usr/bin/groovejaar

    # Install desktop file
    install -D -m 644 $srcdir/groovejaar.desktop $pkgdir/usr/share/applications/groovejaar.desktop

    # Install icon
    install -D -m 644 $srcdir/groovejaar.png $pkgdir/usr/share/pixmaps/groovejaar.png
}
