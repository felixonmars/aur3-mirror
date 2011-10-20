## Maintainer: milomord milomord@gamil.com
pkgname=golems-linux
pkgver=57.0
pkgdesc="Golems is a 3D recreational physics simulator"
pkgrel=1
arch=('any')
url="http://www.golemgame.com"
license=('GPLv3')
depends=('java-runtime')
makedepends=('unzip')
optdepends=('jre: Better performence')
source=('http://www.golemgame.com/data/GolemGame/Golems-linux.zip'
	'golems.desktop'
	'golems.png')
noextract=(Golems-linux.zip)
md5sums=('4e4b4c762f848ad261a9b61eadf1b7c3'
'5a0ec8a66270a6f087f448f137e4b9e7'
'0b8ff4219142aa3aff079da82a69dbaf')

build() {

#Create Directorys
    install -d $pkgdir/opt/golems-linux || return 1
    install -d $pkgdir/usr/bin
#Extract Game 
    unzip $srcdir/Golems-linux.zip || return 1

#Install the data
    cp -r $srcdir/Golems-linux/* $pkgdir/opt/golems-linux || return 1

#Make it executable
    chmod +x $pkgdir/opt/golems-linux/Golems.sh

#Install Game Launcher
    ln -s /opt/golems-linux/Golems.sh $pkgdir/usr/bin/golems

#Install .desktop file
    install -Dm 644 $srcdir/golems.desktop $pkgdir/usr/share/applications/golems.desktop

#Install graphic
    install -Dm 644 $srcdir/golems.png $pkgdir/usr/share/pixmaps/golems.png
}

