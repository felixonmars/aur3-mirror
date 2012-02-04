# Maintainer: Pietro Zambelli <peter.zamb at gmail dot com>
# Based off of gostrc's PKGBUILD for grass-svn in AUR.
pkgname=grass-trunk
pkgver=42358
pkgrel=1
pkgdesc="GRASS 7.0 is the new development branch of GRASS. \
    Geographic Information System (GIS) used for geospatial data management and analysis, \
	image processing, graphics/maps production, spatial modeling, and visualization"
arch=('i686' 'x86_64')
url="http://grass.itc.it/index.php"
license=('GPL')
provides=('grass')
depends=('gdal' 'tk' 'sqlite3' 'xorg-server' 'python' 'mesa' 'swig' 'proj' 'libjpeg>=7' 'libpng' 'libtiff')
makedepends=('mysql' 'postgresql>=8.4.1' 'r' 'fftw' 'freetype2')
optdepends=('fftw: required for i.fft and i.ifft modules'
'postgresql: PostgreSQL database interface'
'r: R language interface'
'lapack: required for GMATH library'
'blas: required for GMATH library')
options=('!libtool' '!makeflags')
install=grass.install
source=(grass.desktop grass.sh grass.png)
md5sums=('14a8cbd7a3d9e170fe49881bd74601c0'
         'f764728ee7c5bc72e3611b343b9a5b76'
         'ae778ed261a40b078a8465994a0eb25e')

_svntrunk=https://svn.osgeo.org/grass/grass/trunk
_svnmod=grass70

build() {
  if [ -d $srcdir/$_svnmod/.svn ]; then
    (cd $srcdir/$_svnmod && svn up)
  else
    msg "Starting SVN checkout"
    svn co $_svntrunk $srcdir/$_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting configure..."

  cd "$srcdir/$_svnmod"
    ./configure --prefix=/opt \
      --with-gdal="/usr/bin/gdal-config" \
      --with-sqlite \
      --with-python \
      --with-wxwidgets="/usr/bin/wx-config"\
      --with-blas \
      --with-lapack \
      --with-postgres \
      --with-proj-libs="/usr/lib" \
      --with-proj-includes="/usr/include" \
      --with-proj-share="/usr/share/proj" \
      --with-fftw \
      --with-fftw-includes="/usr/include" \
      --with-fftw-libs="/usr/lib" \
      --with-freetype=yes \
      --with-freetype-includes="/usr/include/freetype2/" \
      --with-pthread || return 1

  msg "Starting make..."
  make || return 1

  msg "Starting install..."
  make INST_DIR=$pkgdir/opt/grass-$pkgver BINDIR=$pkgdir/usr/bin  install || return 1

  # install grass70 file
  UGLYSTRING="$srcdir/grass70/bin.$CARCH-unknown-linux-gnu"
  install -D -m755 "$UGLYSTRING/grass70" "$pkgdir/usr/bin/grass70" || return 1

  # fix $GISBASE path
  sed -i 's/gisbase\s*=\s*\"\/.*\"\s*/gisbase = "\/opt\/grass70"/g' "$pkgdir/usr/bin/grass70" || return 1

  # strip html docs
  rm -r "$pkgdir/opt/grass-$pkgver/docs/html"

  # install profile.d file
  install -D -m755 "$srcdir/grass.sh" "$pkgdir/etc/profile.d/grass70.sh" || return 1

  # install some freedesktop.org compatibility
  install -D -m644 "$srcdir/grass.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop" || return 1
  install -D -m644 "$srcdir/grass.png" "$pkgdir/usr/share/pixmaps/$pkgname.png" || return 1

  # create a symlink for version work around
  ln -sf /opt/grass-$pkgver "$pkgdir/opt/grass70"

}
# vim:syntax=sh
