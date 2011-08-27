# Maintainer: Archie <xMickael@ifrance.com>

pkgname=mapivi
pkgver=097
pkgrel=1
pkgdesc="Mapivi is a photo management tool with focus on JPEG pictures. Mapivi supports adding, editing and searching of IPTC/IIM, EXIF data and JPEG comments. The pictures are managed in place (in your folder structure)."
depends=('jpegpixi' 'jhead' 'imagemagick' 'libjpeg' 'perl-image-info' 'perl-image-metadata-jpeg' 'tk-matchentry' 'tk-resizebutton' 'tk-splash' 'perl-tk' 'perl-exiftool')
arch=('i686' 'x86_64')
license=('GPL')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname$pkgver.tar.gz)
url="http://mapivi.sourceforge.net/mapivi.shtml"
md5sums=('f1432cbb0033c1a1a324651dbc0700b2')

build() {
  cd $startdir/src/$pkgname$pkgver
  mkdir -p $startdir/pkg/usr/{share,bin}  
  mkdir -p $startdir/pkg/usr/share/{$pkgname,applications,pixmaps}
  mkdir -p $startdir/pkg/usr/share/$pkgname/{html,icons,pics,PlugIns}


  cp pics/*  $startdir/pkg/usr/share/$pkgname/pics/
  cp html/*  $startdir/pkg/usr/share/$pkgname/html/
  cp icons/* $startdir/pkg/usr/share/$pkgname/icons/
  cp PlugIns/*  $startdir/pkg/usr/share/$pkgname/PlugIns/ 
  cp {COPYING,FAQ,INSTALL,mapivi,README,Changes.txt,License.txt,Tips.txt} $startdir/pkg/usr/share/$pkgname/

  cp $startdir/mapivi $startdir/pkg/usr/bin/
  cp $startdir/mapivi.desktop $startdir/pkg/usr/share/applications/
  cp $startdir/mapivi.png $startdir/pkg/usr/share/pixmaps/

  chmod 644 $startdir/pkg/usr/share/mapivi/icons/*
}
