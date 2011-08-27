# $Id: PKGBUILD 46 2008-07-19 20:27:41Z djclue917 $
# Maintainer: Darwin Bautista <djclue917@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=hotpotatoonline
pkgver=1.2.0
pkgrel=11
pkgdesc="Fast-paced arena sport game where players try to explode the opposition using a short-fused potato bomb"
arch=('i686' 'x86_64')
url="http://www.hotpotatoonline.com/"
license=('GPL')
depends=('libgl' 'mesa' 'sdl_mixer')
makedepends=('freeglut' 'unzip')
install=hotpotatoonline.install
source=(http://downloads.sourceforge.net/sourceforge/hponline/HotPotatoOnlineSources-v$pkgver.tar.gz \
        hotpotatoonline.sh \
        hotpotatoonline.png \
        hotpotatoonline.desktop \
        hotpotatoonline-1.2.0-cerrno.patch \
        hotpotatoonline-1.2.0-glfont2.patch \
        hotpotatoonline-1.2.0-glpng.patch \
        hotpotatoonline-1.2.0-gcc43.patch)
md5sums=('75e5c82cb2f7994241200ae85947a989'
         '1bcd8bc189e9a9c1459ad127dd73d84d'
         '6ee0bc8fec2febe65215d62024ea3d3b'
         '003f9ba16f39df128156f80d013b31c6'
         '23989fcd18b51a4e3e53ae3ca1d68356'
         'dd9273ba06ce42290b017d7af7b43011'
         'd993bbe3fbb948da965becf63915ca7d'
         '7ce9e47d97636d48db91215c81bec0fb')

build() {
  cd "$srcdir/HotPotatoOnlineSources-v$pkgver"

  # Apply patches
  patch -Np1 -i ../hotpotatoonline-1.2.0-cerrno.patch || return 1
  patch -Np1 -i ../hotpotatoonline-1.2.0-glfont2.patch || return 1
  patch -Np1 -i ../hotpotatoonline-1.2.0-glpng.patch || return 1
  patch -Np1 -i ../hotpotatoonline-1.2.0-gcc43.patch || return 1

  # Unzip glpng.h
  unzip -qo src/staticlibs/sources/glpng.zip include/GL/glpng.h -d src

  # Build game binary
  make CXXFLAGS="$CXXFLAGS -Wall -DLINUX -DSOUND" || return 1

  # Remove intermediate & unnecessary files
  rm -rf src Makefile *.txt

  # Install game binary and data files
  mkdir -p $pkgdir/opt/hponline
  mv * $pkgdir/opt/hponline/

  # Install icon and shortcut
  install -D -m644 ../hotpotatoonline.png $pkgdir/usr/share/pixmaps/hotpotatoonline.png
  install -D -m644 ../hotpotatoonline.desktop $pkgdir/usr/share/applications/hotpotatoonline.desktop

  # Install shell script
  install -D -m755 ../hotpotatoonline.sh $pkgdir/usr/bin/hotpotatoonline

  # Change group to games then enable write access for that group
  chown root:games $pkgdir/opt/hponline
  chmod 770 $pkgdir/opt/hponline
}

# vim:set ts=2 sw=2 et:
