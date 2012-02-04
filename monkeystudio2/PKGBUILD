# Maintainer : Phil Miller <philm[at]chakra-project[dot]org

pkgname=monkeystudio2
pkgver=1.8.3.3
pkgrel=1
_svn=svn3083
pkgdesc="a free crossplatform Qt4 IDE" 
arch=('i686' 'x86_64') 
url="http://monkeystudio.org" 
depends=('qt') 
conflicts=('monkeystudio' 'kdemod-monkeystudio2' 'kdemod-monkeystudio2-svn' 'monkeystudio2-svn') 
license=('GPL') 
source=(http://monkeystudio.googlecode.com/files/mks_${pkgver}-${_svn}-src.tar.gz) 

md5sums=('e748f88770e6b783731d73aed234e597')

build()
{

  cd $startdir/src/mks_$pkgver-$_svn
  qmake prefix=/usr
  make || return 1
  
  #create dirs
  mkdir -p $startdir/pkg/usr/share/monkeystudio/apis/
  mkdir -p $startdir/pkg/usr/share/monkeystudio/translations/
  mkdir -p $startdir/pkg/usr/lib/monkeystudio/
  mkdir -p $startdir/pkg/usr/bin/
  mkdir -p $startdir/pkg/usr/share/applications/
  mkdir -p $startdir/pkg/usr/share/pixmaps/
  #install monkeystudio
  cp -f -r $startdir/src/mks_$pkgver-$_svn/templates $startdir/pkg/usr/share/monkeystudio/
  cp -f -r $startdir/src/mks_$pkgver-$_svn/ctags/apis $startdir/pkg/usr/share/monkeystudio/
  chmod 644 $startdir/pkg/usr/share/monkeystudio/apis/*
  cp -f -r $startdir/src/mks_$pkgver-$_svn/translations $startdir/pkg/usr/share/monkeystudio/
  chmod 644 $startdir/pkg/usr/share/monkeystudio/translations/*                                                                                                                                                                                                              
  cp -f -r $startdir/src/mks_$pkgver-$_svn/bin/plugins/* $startdir/pkg/usr/lib/monkeystudio/                                                
  install -m 755 -p $startdir/src/mks_$pkgver-$_svn/bin/monkeystudio $startdir/pkg/usr/bin/                             
  strip $startdir/pkg/usr/bin/monkeystudio                                                                                                                                   
  install -m 644 -p $startdir/src/mks_$pkgver-$_svn/links/monkeystudio.desktop $startdir/pkg/usr/share/applications/    
  install -m 644 -p $startdir/src/mks_$pkgver-$_svn/links/monkeystudio.png $startdir/pkg/usr/share/pixmaps/
}

