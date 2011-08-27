# Contributor: vn158 <vn158 at seznam dot cz>
pkgname=thrustburst
pkgver=1.051
pkgrel=1
pkgdesc="Side scrolling shoot-em-up arcade game"
arch=(i686 x86_64)
url="http://www.umlautgames.net/"
license=('custom:freeware')
depends=()
[ "$CARCH" = i686   ] && depends=(wine msvc60 openal)
[ "$CARCH" = x86_64 ] && depends=(bin32-wine msvc60 lib32-openal)
makedepends=('icoutils')
source=($pkgname $pkgname.desktop http://www.wayofthepixel.net/umlautgames/thrustburst_1051.zip)
md5sums=('17ec5686e37dbfd83ca33a35a4314874' 'c76234bb8ebb4ed5575c54ca1cf389ef' '90372781e27d4837a91d6389c78066c1')
options=(!strip)

build() {

  cd "$startdir"

  wrestool -x -t14 src/$pkgname.exe > $pkgname.ico
  icotool -x $pkgname.ico
  mv -f $pkgname*64x64x8.png $pkgname.png

  install -d -m755 pkg/usr/share/$pkgname

  cp -ra src/*.exe src/*.d?? src/mus pkg/usr/share/$pkgname
  tr -d \\r < src/readme.txt > pkg/usr/share/$pkgname/readme.txt
  find pkg/usr/share/$pkgname -type d -exec chmod 755 "{}" \;
  find pkg/usr/share/$pkgname -type f -exec chmod 644 "{}" \;

  install -d -m755 pkg/usr/bin
  install -m755 $pkgname pkg/usr/bin
  
  # Install desktop file
  install -D -m644 $pkgname.png $startdir/pkg/usr/share/pixmaps/$pkgname.png
  install -D -m644 $pkgname.desktop $startdir/pkg/usr/share/applications/$pkgname.desktop
	    
}
