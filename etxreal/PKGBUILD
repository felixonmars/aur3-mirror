# Maintainer: Babets

PKGEXT=".pkg.tar"

pkgname=etxreal
_pkgname=ETXreaL
pkgver=0.3.0_20111110
_pkgver=0.3.0-20111110
pkgrel=2
pkgdesc="ET:XreaL is an XreaL subproject bringing all XreaL enhancements to Return to Castle Wolfenstein: Enemy Territory."
arch=('i686' 'x86_64')
url="http://www.moddb.com/mods/etxreal"
license=('GPL')
depends=('curl' 'sdl' 'libxxf86dga' 'libxxf86vm' 'mesa' 'boost-libs' 'etxreal-etfiles')
makedepends=('p7zip' 'boost' 'premake')
provides=('enemy-territory')
replaces=('enemy-territory')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/xreal/$_pkgname-$_pkgver.7z
        ETXreaL.desktop
        ${pkgname}.launcher
        $pkgname-dedicated.launcher
        etxmap.launcher)
md5sums=('a105a0b79e8e24bdbb87aa3f48c8c661'
         '1e07814d4fd037874fbcbfc8bc72f5d0'
         'c122fa0a578b761e84d051979482e9ec'
         '0045a2e9fdfb59082826690661e7cf9e'
         '2dd4e79b9eccbc15cbc39e836a6c91c7')
build() {
  cd $srcdir
  7z x $_pkgname-$_pkgver.7z -y

  cd "$_pkgname-$_pkgver"

  # remove precompiled files
  rm -r  {bin,etmain/*.so,etmain/*.dll}

  #./premake4 gmake
  # using system premake
  premake4 gmake

  [ "${CARCH}" = "i686"   ] && make
  [ "${CARCH}" = "x86_64" ] && make config=release64
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"

  # create destination directories
  install -d $pkgdir/usr/share/$pkgname/{bin,docs,etmain,omni-bot}
  install -d $pkgdir/usr/share/applications
  install -d $pkgdir/usr/bin

  # install etxreal-specific files
  [ "${CARCH}" = "i686"   ] && install -Dm 755 bin/linux-x86/* $pkgdir/usr/share/$pkgname/bin
  [ "${CARCH}" = "x86_64" ] && install -Dm 755 bin/linux-x86_64/* $pkgdir/usr/share/$pkgname/bin
  install -Dm 644 docs/* $pkgdir/usr/share/$pkgname/docs
  install -Dm 644 etmain/*.so $pkgdir/usr/share/$pkgname/etmain
  install -Dm 644 etmain/*.pk3 $pkgdir/usr/share/$pkgname/etmain
 
 # test and fix omni-bot!!!!
  cp -R omni-bot/* $pkgdir/usr/share/$pkgname/omni-bot
  rm -rf $pkgdir/usr/share/$pkgname/omni-bot/src
  chmod -R go+r $pkgdir/usr/share/$pkgname/omni-bot
  find $pkgdir/usr/share/$pkgname/omni-bot -type d | xargs chmod go+rx

  cd ..

  # install desktop file (icon provided by etxreal-etfiles)
  install -Dm 644 $_pkgname.desktop $pkgdir/usr/share/applications

  # install launch scripts
  install -Dm 755 etxreal.launcher $pkgdir/usr/bin/$pkgname
  install -Dm 755 $pkgname-dedicated.launcher $pkgdir/usr/bin/$pkgname-dedicated
  install -Dm 755 etxmap.launcher $pkgdir/usr/bin/etxmap

}

# vim:set ts=2 sw=2 et:

