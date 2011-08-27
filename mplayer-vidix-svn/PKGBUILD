# Contributor: Benjamin Bukowski <benjamin.bukowski@googlemail.com>
# Maintainer: Alessandro Pezzoni <alessandro_pezzoni@lavabit.com>

pkgname=mplayer-vidix-svn
pkgver=32897
pkgrel=1
pkgdesc="A movie player for linux, compiled with VIDIX video output"
arch=('i686' 'x86_64')
url="http://www.mplayerhq.hu/"
license=('GPL2')
depends=('ttf-dejavu' 'svgalib-helper')
makedepends=('subversion' 'yasm')
provides=("mplayer=$pkgver" "mplayer-svn=$pkgver")
conflicts=('mplayer')
backup=("etc/mplayer/mplayer.conf"
				"etc/mplayer/codecs.conf"
				"etc/mplayer/input.conf"
				"etc/mplayer/menu.conf"
				"etc/mplayer/dvb-menu.conf")
install=mplayer-svn.install
_svgalib_version=1.9.25
source=("http://my.arava.co.il/~matan/svgalib/svgalib-${_svgalib_version}.tar.gz"
        'configure-copy-disabled-features.patch'
        'mplayer.conf')

md5sums=('4dda7e779e550b7404cfe118f1d74222'
         'db50b7f27969045172ed7d1eebca47cf'
         'd82577aa11f1077dea79ccdda27d0641')

_svntrunk=svn://svn.mplayerhq.hu/mplayer/trunk
_svnmod=mplayer
_svgalib_installed_version=`pacman -Qs svgalib-helper |\
	 grep "local" |\
	 sed 's@local/svgalib-helper @@' |\
	 sed 's/-.*//'`

build() {
  if [ ! "$_svgalib_installed_version" = "$_svgalib_version" ]; then
    echo "Installed svgalib-helper and source versions differ."
    echo "Aborting."
    exit 1
  fi

  cd "$srcdir"

  if [ -d $_svnmod/.svn  ]; then
    (cd $_svnmod && svn up -r $pkgver) || return 1
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod || return 1
  fi

  msg "SVN checkout done or server timeout"


	rm -rf "$srcdir/$_svnmod-build"
	cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  # Applying some patches...
  for patch in ../*.patch; do
    msg "Applying $patch..."
    patch -Np1 -i $patch
  done

  # Use the mplayer's configure script autodetection.
  # GUI is disabled by default,most options are autodetected.
  # Make sure you have the related package (ex: lirc) before building.
  # go in souce and run ./configure --help to see what's disabled by default
  # for GUI add '--enable-gui'
  # for Joystick add '--enable-joystick'  

  # Custom FLAGS break the mplayer build
  unset CFLAGS LDFLAGS

  # If you experience problems with mkvs, try to add the following option
  # to configure '--extra-cflags=-fno-strict-aliasing'

  echo "\n" | ./configure --prefix=/usr \
      --confdir=/etc/mplayer \
      --language=all \
      --disable-gui \
      --enable-svgalib_helper \
      --extra-cflags="-I$srcdir/svgalib-${_svgalib_version}/kernel/svgalib_helper/" || return 1

  [ "$CARCH" == "i686" ] && sed 's|-march=i484|-march=i686|g' -i config.mak

  msg "Starting make..."

  make || return 1
  make DESTDIR="$pkgdir/" install || return 1

  install -Dm644 etc/{codecs.conf,dvb-menu.conf,example.conf,input.conf,menu.conf} $pkgdir/etc/mplayer/ || return 1
  install -dm755 $pkgdir/usr/share/mplayer/ || return 1
	install -m644 etc/{mplayer.desktop,mplayer.ico,mplayer.xpm} $pkgdir/usr/share/mplayer/ || return 1
  install -m644 disabled_features $pkgdir/etc/mplayer/ || return 1
	install -m644 $srcdir/mplayer.conf $pkgdir/etc/mplayer/ || return 1
}

# vim:set ts=2 sw=2 et:
