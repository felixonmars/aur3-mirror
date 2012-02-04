# Contributor: Black_Mage <vleon1@gmail.com>

pkgname=tbp
pkgver=3.4b
pkgrel=2
pkgdesc="The Babylon Project is a group of dedicated individuals who are trying to bring the essence of Babylon 5 space combat to Freespace 2 engine"
url="http://babylon.hard-light.net/"
arch=('i686' 'x86_64')
license=('custom:freespace2')
depends=('fs2_open-svn')
optdepends=('tbp-cpack: extra campaigns')
makedepends=('p7zip')
source=(TheBabylonProject.7z::http://www.freespacemods.net/request.php?220
        tbp.png
        tbp.desktop
        tbp.sh)
        
md5sums=('f61c73bc19b55d315049e13dabb98290'
         '6cb63b63d46927f37473e0ea6678c262'
         '529b3ba8ccaf50605862dd24be492c1a'
         'e856b612710e2f5ed3e9754078fafb88')

build() {

  #Install the package
  7z x TheBabylonProject.7z -o$pkgdir/opt/
  mv $pkgdir/opt/The\ Babylon\ Project  $pkgdir/opt/tbp

  #Remove obsolute configs parameters for fs2_open (its one line because otherwise, the file created has extra spaces ^.^)
  sed "1,1c\-ambient_factor 65 -spec -glow -env -mipmap -nomotiondebris -missile_lighting -dualscanlines -targetinfo -orbradar -rearm_timer -ship_choice_3d -3dwarp -warp_flash -tbp -snd_preload" -i $pkgdir/opt/tbp/data/cmdline_fso.cfg

  #Fix the permissions of the package
  find $pkgdir/opt -type f -exec chmod 644 {} + || return 1
  find $pkgdir/opt -type d -exec chmod 755 {} + || return 1
  
  #Install the .desktop and icon files
  install -D -m644 $srcdir/tbp.png $pkgdir/usr/share/pixmaps/tbp.png
  install -D -m644 $srcdir/tbp.desktop $pkgdir/usr/share/applications/tbp.desktop

  #Install the bin file
  install -D -m755 $srcdir/tbp.sh $pkgdir/usr/bin/tbp
  
}

# vim:set ts=2 sw=2 et:
