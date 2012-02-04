# Maintainer: Todd Partridge <dirk.r.gently@gmail.com>
# Contributor: Stefan Lohmaier <noneus@noneus.de>

pkgname=vdrift-svn
pkgver=2514
pkgrel=1
pkgdesc="Drift Racing Simulation Game (Full-Install)"
url="http://vdrift.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('freealut' 'glew' 'mesa' 'sdl_gfx' 'sdl_image' 'sdl_net')
makedepends=('asio' 'boost' 'scons' 'subversion')
conflicts=('vdrift')
provides=('vdrift')

source=(vdrift.desktop vdrift.sh scons.patch)

_svntrunk=http://svn.vdrift.net/repos/vdrift/trunk
_svnmod=vdrift

build() {
  cd $srcdir

  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  cd $_svnmod
  svn co https://vdrift.svn.sourceforge.net/svnroot/vdrift/vdrift-data data
  cd ..

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_svnmod-build
  msg "Copying SVN checkout to build directory. This will take a while..."
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  patch -p0 < $srcdir/scons.patch

  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/icons/hicolor/16x16/apps
  mkdir -p $pkgdir/usr/share/icons/hicolor/32x32/apps
  mkdir -p $pkgdir/usr/share/icons/hicolor/64x64/apps
  
  # Compile flags to pass to SCONS (a64 for x86_64, 686 for i686)
  if [ "$CARCH" = "x86_64" ]; then
    _SCONSARCH="arch=a64"; else
    _SCONSARCH="arch=686"
  fi

  #SCONSFLAGS="destdir=$pkgdir release=1 os_cxxflags=1 force_feedback=1 \
  #old_openal=1"
  #SCONSFLAGS="destdir=$pkgdir release=1 os_cxxflags=1 force_feedback=1"
  SCONSFLAGS="destdir=$pkgdir release=1 $_SCONSARCH force_feedback=1 prefix=/usr"
  scons install $SCONSFLAGS

  #copy icons & desktop file, shell script
#  install -D -m755 $srcdir/vdrift.sh $pkgdir/usr/bin/vdrift
  install -D -m644 data/textures/icons/vdrift-16x16.png $pkgdir/usr/share/icons/hicolor/16x16/apps/vdrift.png
  install -D -m644 data/textures/icons/vdrift-32x32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/vdrift.png
  install -D -m644 data/textures/icons/vdrift-64x64.png $pkgdir/usr/share/icons/hicolor/64x64/apps/vdrift.png
  install -D -m644 $srcdir/vdrift.desktop $pkgdir/usr/share/applications

  rm -rf $srcdir/$_svnmod-build
}

md5sums=('7b0f8ddd70620311e05f67c93f32b775'
         '6b3dc521abb5c3ccc5f681c71a0bac35'
         'c2f9af3f77a340b4eb29e2811bb8cb60')
