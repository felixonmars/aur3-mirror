# Maintainer: David H. Bronke <david.bronke@g33xnexus.com>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=blender2.5a2
pkgver=2.5a2
pkgrel=4
pkgdesc="A fully integrated 3D graphics creation suite (binary version)"
arch=('i686' 'x86_64')
url="http://blender.org/"
license=('GPL')
depends=('libgl' 'libjpeg6' 'libx11' 'libxau' 'libxcb' 'libxdamage' 'libxdmcp' 'libxext' 'libxfixes' 'libxi' 'libxxf86vm' 'python3' 'sdl' 'zlib' 'libpng12' 'libsamplerate')
makedepends=('librsvg')
provides=('blender')
conflicts=('blender')
install=blender.install
source=('blender.desktop')
sha1sums=('e33f0e8a90e4c9f159c2de987e3d48d1fea27ce6')

case ${CARCH} in
  i686)
    source=(${source[@]} 'http://download.blender.org/release/Blender2.50alpha/blender-2.5-alpha2-linux-glibc27-i686.tar.bz2')
    sha1sums=(${sha1sums[@]} '089f0376ac06783ecb68ff205a65141913ab8c7e')
    ;;
  x86_64)
    source=(${source[@]} 'http://download.blender.org/release/Blender2.50alpha/blender-2.5-alpha2-linux-glibc27-x86_64.tar.bz2')
    sha1sums=(${sha1sums[@]} 'eab530739634f2a4562c6c67c5e7b69fcb3088f6')
    ;;
esac

build() {
  mkdir -p $pkgdir/usr/{share/blender,share/icons/hicolor,share/pixmaps,bin}
  case ${CARCH} in
    i686)
      cd $srcdir/blender-2.5-alpha2-linux-glibc27-i686
      ;;
    x86_64)
      cd $srcdir/blender-2.5-alpha2-linux-glibc27-x86_64
      ;;
  esac

  cp -r .blender/locale $pkgdir/usr/share
  cp -r .blender/scripts $pkgdir/usr/share/blender
  cp -r icons/* $pkgdir/usr/share/icons/hicolor
  cp icons/scalable/blender.svg $pkgdir/usr/share/pixmaps/
  cp blender $pkgdir/usr/bin
  cp blender-softwaregl $pkgdir/usr/bin

  # stolen from blender in extra
  install -Dm644 $srcdir/blender.desktop $pkgdir/usr/share/applications/blender.desktop
}
