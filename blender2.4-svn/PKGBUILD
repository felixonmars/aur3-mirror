# Contributor: Jeroen Volman <jeroenvolman@gmail.com>
pkgname=blender2.4-svn
pkgver=24534
pkgrel=1
pkgdesc="Subversion version of Blender 2.49 optimized for current system"
arch=('i686' 'x86_64')
url="http://blender.org/"
depends=('libgl' 'mesa' 'libjpeg' 'libpng' 'openexr' 'gettext' 'python' 'sdl' 'ffmpeg' 'openal')
makedepends=('subversion' 'yasm')
provides=('blender')
conflicts=('blender')
license=('GPL')
install=blender.install
source=(blender.desktop blender.sh blenderplayer.sh user-config.py)
md5sums=('1aaea0e3afb460368b5860ca6fcaa7f8'
         '35f3fd5f0832776abb1991405c23fe74'
         '831e28d0cd2ac983d23002f06254d031'
         'ed784c1f8cc541ae8a9a8e61492931a2')

_svntrunk="https://svn.blender.org/svnroot/bf-blender/branches/blender2.4"
_svnmod="blender"

build() {
  # download source
  cd $srcdir
  msg "Checking out Blender source from $_svntrunk..."
  svn co $_svntrunk -r $pkgver $_svnmod
  msg "Checkout complete or server timeout..."

  # copy configuration
  cp $srcdir/user-config.py $srcdir/$_svnmod
  cd $srcdir/$_svnmod

  # compile blender
  msg "Compiling Blender..."
  python scons/scons.py || return 1

  # install blender
  install -D -m755  $srcdir/blender.sh $pkgdir/usr/bin/blender
  install -D -m755 $srcdir/blenderplayer.sh $pkgdir/usr/bin/blenderplayer
  install -D -m644 $srcdir/blender.desktop \
    $pkgdir/usr/share/applications/blender.desktop

  cd $srcdir/install/linux2
  install -D -m755 blender $pkgdir/usr/share/$_svnmod/blender
  install -D -m755 blenderplayer $pkgdir/usr/share/$_svnmod/blenderplayer
  cp -r plugins $pkgdir/usr/share/$_svnmod/plugins
  
  cd $srcdir/install/linux2/.blender
  cp .Blanguages $pkgdir/usr/share/$_svnmod/Blanguages
  cp .bfont.ttf $pkgdir/usr/share/$_svnmod/bfont.ttf
  cp -r scripts $pkgdir/usr/share/$_svnmod/scripts
  cp -r locale $pkgdir/usr/share/locale

  cd $srcdir/install/linux2/icons
  for icondir in *; do
    if [ $icondir != "scalable" ]; then
      install -D -m644 $icondir/blender.png \
        $pkgdir/usr/share/icons/hicolor/$icondir/apps/blender.png
    else
      install -D -m644 $icondir/blender.svg \
        $pkgdir/usr/share/icons/hicolor/$icondir/apps/blender.svg
    fi
  done
}

# vim: set ts=2 sw=2 sts=2 et ai:
