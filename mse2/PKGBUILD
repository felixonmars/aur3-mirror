# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=mse2
pkgver=0.3.8
pkgrel=1
pkgdesc="Magic Set Editor is a program in which you can enter your own Magic cards"
url="http://magicseteditor.sourceforge.net/welcome"
arch=('i686')
license=('GPL')
source=('http://downloads.sourceforge.net/magicseteditor/mse-0.3.8-linux.tar.gz' 'magicseteditor.desktop' 'http://dl.getdropbox.com/u/685412/Magic.tar.gz')
backup=('etc/sysconfig/ifled')
md5sums=('f92d3a04a65e30f35a812cffeda32638'
         '7d8e847a9a1088893e94c6322893c31c'
         '1ed8101bf50c57b6034f8e5ffe74d6d9')

build() {
  cd $startdir/src/magicseteditor

  cp program/resource/selected_yes.png program/resource/selected.png
  cp program/resource/selected_no.png program/resource/deselected.png
  
  mkdir -p $startdir/pkg/usr/local/share/magicseteditor/
  mkdir -p $startdir/pkg/usr/share/applications/
  mkdir -p $startdir/pkg/usr/share/fonts/mse
  install -m755 $startdir/src/magicseteditor/program/magicseteditor $startdir/pkg/usr/local/share/magicseteditor/magicseteditor
  cp -R $startdir/src/magicseteditor/program/data/ $startdir/pkg/usr/local/share/magicseteditor/
  cp -R $startdir/src/magicseteditor/program/resource/ $startdir/pkg/usr/local/share/magicseteditor/
  chmod -R 755  $startdir/pkg/usr/local/share/magicseteditor/

  mkdir -p $startdir/pkg/usr/bin/i
  ln -s "../local/share/magicseteditor/magicseteditor" "$startdir/pkg/usr/bin/magicseteditor"

  # install desktop file
  install -Dm644 $startdir/magicseteditor.desktop $startdir/pkg/usr/share/applications/magicseteditor.desktop

  # install Magic fonts :)
  install -Dm644 $startdir/src/Magic/* $startdir/pkg/usr/share/fonts/mse/
}
