# Contributor: Dario Andres Rodriguez <darzephyr@gmail.com>

pkgname=jmp3renamer
pkgver=2.1.4
pkgrel=1
pkgdesc="A plugin-based renamer/tagger written in Java. It supports automatical assignment of the data to the files and magic cookies to specify the filename format."
arch=('i686')
url="http://www.hampelratte.org/jmp3/"
license=('GPL' 'LGPL' 'BSD')
depends=('jre')
makedepends=('unzip')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/JMP3Renamer-$pkgver.zip jmp3renamer jmp3renamer.desktop jmp3renamer.png)
md5sums=('2a0c6c7ba3d7fec564b27e3e4268679a' '9a364d3ec07b5a9b52859e011ee5e0bf' '5edd4c96be09b40476d87142443c8289' 'a8097ace88ff8b92270d9d34c6dddb8f')

build() {

  mkdir $startdir/pkg/usr/{share/java/jmp3renamer,bin,share/applications,share/pixmaps} -p

  #App files
  cd $startdir/src/JMP3Renamer-$pkgver/
  cp {JMP3Renamer.jar,plugins,Changelog.txt} $startdir/pkg/usr/share/java/jmp3renamer/ -r
  cp $startdir/src/jmp3renamer $startdir/pkg/usr/bin/

  #Icon & .desktop
  cp $startdir/src/jmp3renamer.desktop  $startdir/pkg/usr/share/applications/
  cp $startdir/src/jmp3renamer.png  $startdir/pkg/usr/share/pixmaps/

}
