# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>

pkgname=wormsofprey
pkgver=0.4.3
pkgrel=1
pkgdesc="A new and free real-time Worms game."
url="http://www.wormsofprey.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl_ttf' 'sdl_net' 'sdl_mixer' 'sdl_image')
source=(http://www.wormsofprey.org/download/wop-$pkgver-src.tar.bz2 
        http://wormsofprey.org/download/wopdata-2005-12-21.tar.bz2
        wop.desktop
        wormsofprey.patch)
    
md5sums=('ae07e9e1092de6c447a9af2cf8e90959'
         '0bf42f28e03dcac5c8066b46d7733907'
         'c1dbee54839fbba119a00925fa4a4702'
         'd3c489bacd8d079fac32f6e96dd0ecbf')
 
build() {
  
  #Patching and building the package
  cd $srcdir/wop-$pkgver
  patch -Np0 -i $srcdir/wormsofprey.patch || return 1
  sed -i 's:/etc/woprc:/opt/wop/etc/woprc:g' src/wopsettings.cpp || return 1
  sed -i 's:^data =.*$:data = /opt/wop/data:' woprc || return 1
  touch {sdlwidgets,src}/Makefile.depend || return 1
  make -d || return 1

  #Manually installing the package
  install -d -m755 $pkgdir/opt/wop/{data,etc}
  cp woprc $pkgdir/opt/wop/etc
  cp -R $srcdir/wopdata-2005-12-21/* $pkgdir/opt/wop/data
  chmod a+r $pkgdir
  
  #Installing the .desktop and icon files
  install -D -m644 $srcdir/wop.desktop $pkgdir/usr/share/applications/wop.desktop
  install -D -m644 $srcdir/wopdata-2005-12-21/images/gui/wop32.png $pkgdir/usr/share/pixmaps/wop.png
  
  #Installing the binary file
  install -D -m755 bin/wop $pkgdir/usr/bin/wop
  
}

# vim:set ts=2 sw=2 et:
