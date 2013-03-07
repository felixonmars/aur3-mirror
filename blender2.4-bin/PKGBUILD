# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=blender2.4-bin
pkgver=2.6
pkgrel=2
pkgdesc="A fully integrated 3D graphics creation suite, old 2.4 version (binary version)"
arch=('i686' 'x86_64')
url="http://blender.org/"
license=('GPL')
depends=('libgl' 'libjpeg6' 'libx11' 'libxau' 'libxcb' 'libxdamage' 'libxdmcp' 'libxext' 'libxfixes' 'libxi' 'libxxf86vm' 'python2' 'sdl' 'zlib')
provides=('blender')
conflicts=('blender')
install=blender.install
source=('http://mirror.cs.umn.edu/blender.org/release//Blender2.66/blender-2.66a-linux-glibc211-i686.tar.bz2')
md5sums=('e41d112fdbf1e97bf3f78148afc6b017')

case ${CARCH} in
  i686)
  source=(${source[@]} 'http://video.blendertestbuilds.de/download.blender.org/release/Blender2.49b/blender-2.49b-linux-glibc236-py26-i386.tar.bz2')
    md5sums=(${md5sums[@]} 'f9157c5142fc0638ab2970033b7a91a0');;
  x86_64)
  source=(${source[@]} 'http://video.blendertestbuilds.de/download.blender.org/release/Blender2.49b/blender-2.49b-linux-glibc236-py26-x86_64.tar.bz2')
    md5sums=(${md5sums[@]} '58822737042a0bd220553ac78994722f');;
esac

build() {
  mkdir -p $pkgdir/usr/{share/blender,share/icons/hicolor,bin}
  case ${CARCH} in
    i686)
      cd $srcdir/blender-2.49b-linux-glibc236-py26-i386
      ;;
    x86_64)
      cd $srcdir/blender-2.49b-linux-glibc236-py26-x86_64
      ;;
  esac

  cp -r .blender/locale $pkgdir/usr/share
  cp -r .blender/scripts $pkgdir/usr/share/blender
  cp -r icons/* $pkgdir/usr/share/icons/hicolor
  cp blender $pkgdir/usr/bin
  cp blenderplayer $pkgdir/usr/bin

  # stolen from blender in extra
  install -Dm644 $srcdir/blender.desktop $pkgdir/usr/share/applications/blender.desktop
}

# vim:set ts=2 sw=2 et:
