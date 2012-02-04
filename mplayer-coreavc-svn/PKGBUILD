
# Contributor:  lucke <noneus att noneus dot de>
# Contributor:  Daniele Marinello <marinz att email dot it> 
# Contributor:  crazyb0y <bjin1990 at gmail dot com>

pkgname=mplayer-coreavc-svn
pkgver=34077
pkgrel=1
pkgdesc="A movie player for linux, with coreavc patch"
arch=('i686' 'x86_64')
url="http://www.mplayerhq.hu/"
license=('GPL2')
depends=('ttf-dejavu' 'dshowserver-svn')
makedepends=('subversion' 'yasm' 'git')
provides=("mplayer=$pkgver" "mplayer-svn=$pkgver")
conflicts=('mplayer')
backup=("etc/mplayer/mplayer.conf"
        "etc/mplayer/codecs.conf"
        "etc/mplayer/input.conf"
        "etc/mplayer/menu.conf"
        "etc/mplayer/dvb-menu.conf")
install='mplayer-svn.install'
source=('configure-copy-disabled-features.patch' 
        'mplayer.conf'
        'codec_coreserve.conf'
        'dshowserver.patch')

md5sums=('4149adf3e6fe6bf4d60e8552b3c7729b'
         'd82577aa11f1077dea79ccdda27d0641'
         '844d6f5198fb1965b8dcfc3bf03a4d5b'
         '65b5bcf4ac518cc4e3468435b7ddc345')

_svntrunk=svn://svn.mplayerhq.hu/mplayer/trunk
_svnmod=mplayer

_ffmpeggitroot="git://git.videolan.org/ffmpeg.git"
_ffmpeggitname="ffmpeg"

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn  ]; then
    (cd $_svnmod && svn up -r $pkgver) || return 1
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod || return 1
  fi
  msg "SVN checkout done or server timeout"

  msg "Retrieving latest ffmpeg sources from git"
  cd "$srcdir/$_svnmod"
  if [[ -d $_ffmpeggitname ]] ; then
    cd $_ffmpeggitname
    git pull origin
  else
    git clone --depth 1 $_ffmpeggitroot $_ffmpeggitname || return 1
  fi
  msg "GIT checkout done"

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  # Applying some patches...
  for patch in ../*.patch; do
    msg "Applying `basename $patch`..."
    patch -Np0 -i $patch
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

  ./configure --prefix=/usr --confdir=/etc/mplayer --language=all || return 1

  [ "$CARCH" == "i686" ] && sed 's|-march=i484|-march=i686|g' -i config.mak

  msg "Starting make..."

  make || return 1
  cat $srcdir/codec_coreserve.conf >> etc/codecs.conf
  make DESTDIR="$pkgdir/" install || return 1

  install -Dm644 etc/{codecs.conf,dvb-menu.conf,example.conf,input.conf,menu.conf} $pkgdir/etc/mplayer/ || return 1
  install -dm755 $pkgdir/usr/share/mplayer/ || return 1
  install -m644 etc/{mplayer.desktop,mplayer.ico,mplayer.png} $pkgdir/usr/share/mplayer/ || return 1
  install -m644 disabled_features $pkgdir/etc/mplayer/ || return 1
  install -m644 $srcdir/mplayer.conf $pkgdir/etc/mplayer/ || return 1
}
