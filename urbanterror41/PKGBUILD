# $Id: PKGBUILD 58231 2011-11-09 03:13:26Z svenstaro $
# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: grimi <grimi at poczta dot fm>
# This package has been imported from ABS

pkgname=urbanterror41
pkgver=4.1
pkgrel=13
pkgdesc="A team-based tactical shooter based on the Quake 3 Engine"
arch=('i686' 'x86_64')
url="http://www.urbanterror.net"
license=('GPL2')
depends=('sdl' 'openal' 'curl' 'urbanterror41-data')
makedepends=('mesa')
source=("http://ftp.snt.utwente.nl/pub/games/urbanterror/iourbanterror/source/complete/ioUrbanTerrorSource_2007_12_20.zip"
        "urbanterror_home.patch"
        "default-curl_lib.patch"
        "cmd.c.patch"
        "l_precomp.c.patch"
        "g_cmds.c.patch"
        "qcommon.h.patch"
        "sv_client.c.patch"
        "sv_main.c.patch"
        "urbanterror.sh"
        "urbanterror-server.sh"
        "urbanterror41.desktop"
        "urbanterror41.png")
md5sums=('4dbe5a03a10f23138f42b5e0dc39598b'
         'a1d992453aa64108c0b7b8304484c21f'
         'e917e9fe1210598885665e13a40c11d8'
         '0e5cc83478b8d37f59740620e5eccd21'
         '4485f84a4a9bc9a25f2737ee1744febd'
         '1120e5f2a3a5944f219a432e5eb9bcaa'
         'a12059253d555fdb169d2717899b47e6'
         '57241e730301a78d1b13de5b9cc9f68a'
         '8b24a2aa5446e9c6ccbc04e844b189ab'
         'da745c0a30b0df00e1c0755182d1d1c6'
         'd1b555098150ec64297008b1e4f732ca'
         '72a412522a0e224bc17976ed546d5404'
         'f9a57d898df73f43c6a85c8d8cc455ba')
# disable buggy SMP compilation
#MAKEFLAGS=-j5

build() {
  # Patch urbanterror home.
  cd $srcdir
  patch -Np0 -i urbanterror_home.patch

  # Patch le master servers.
  sed -i 's/master.urbanterror.net/master.urbanterror.info/g' \
    $srcdir/ioUrbanTerrorServerSource/code/qcommon/qcommon.h \
    $srcdir/ioUrbanTerrorClientSource/code/qcommon/qcommon.h
  sed -i 's/master2.urbanterror.net/master2.urbanterror.info/g' \
    $srcdir/ioUrbanTerrorServerSource/code/qcommon/qcommon.h \
    $srcdir/ioUrbanTerrorClientSource/code/qcommon/qcommon.h

  sed -i 's/-Werror//g' $srcdir/ioUrbanTerrorClientSource/code/tools/asm/Makefile

  # Patch and compile client.
  cd $srcdir/ioUrbanTerrorClientSource
  patch -Np0 -i $srcdir/default-curl_lib.patch
  patch -Np1 -i $srcdir/l_precomp.c.patch
  make

  # Patch and compile server.
  cd $srcdir/ioUrbanTerrorServerSource
  patch -Np1 -i $srcdir/cmd.c.patch
  patch -Np1 -i $srcdir/g_cmds.c.patch
  patch -Np1 -i $srcdir/qcommon.h.patch
  patch -Np1 -i $srcdir/sv_client.c.patch
  patch -Np1 -i $srcdir/sv_main.c.patch
  patch -Np1 -i $srcdir/l_precomp.c.patch
  make
}

package() {
  install -d $pkgdir/opt/urbanterror41

  cd $pkgdir/opt/urbanterror41

  # Copy binaries.
  install -m755 $srcdir/ioUrbanTerrorClientSource/build/release-linux-*/ioUrbanTerror.* ioUrbanTerror
  install -m755 $srcdir/ioUrbanTerrorServerSource/build/release-linux-*/ioUrTded.* ioUrTded

  # Copy desktop launcher.
  install -Dm644 $srcdir/urbanterror41.desktop $pkgdir/usr/share/applications/urbanterror41.desktop
  install -Dm644 $srcdir/urbanterror41.png $pkgdir/usr/share/pixmaps/urbanterror41.png

  # Copy launch scripts.
  install -Dm755 $srcdir/urbanterror.sh $pkgdir/usr/bin/urbanterror41
  install -Dm755 $srcdir/urbanterror-server.sh $pkgdir/usr/bin/urbanterror41-server
}

# vim: sw=2:ts=2 et:
