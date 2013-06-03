# Maintainer: Michal Wazgird <packages at cyryl dot net>
# Contributor: Benjamin Bukowski <benjamin.bukowski@googlemail.com>
# compile svn mplayer with additional patch-set.
# Patches included:
# - full MicroDVD language support
# - corrected limbsmbclient.h path for samba 4.0
pkgname=mplayer-microdvd
pkgver=36295
pkgrel=2
pkgdesc="Mplayer and mencoder compiled with full MicroDVD support"
arch=('i686' 'x86_64')
url="http://www.mplayerhq.hu/"
license=('GPL2')
depends=('ttf-dejavu')
makedepends=('subversion' 'yasm' 'git')
provides=("mplayer=$pkgver" "mplayer-microdvd=$pkgver" "mencoder=$pkgver" "mencoder-microdvd=$pkgver")
conflicts=('mplayer' 'mencoder')
backup=("etc/mplayer/mplayer.conf"
        "etc/mplayer/codecs.conf"
        "etc/mplayer/input.conf"
        "etc/mplayer/menu.conf"
        "etc/mplayer/dvb-menu.conf")
install='mplayer-microdvd.install'
changelog='ChangeLog'
source=('p1-configure-copy-disabled-features.patch'
        'p0-MicroDVD-36279.patch'
        'p0-smb-4.0-include-path.patch'
        'mplayer.conf')

md5sums=('db50b7f27969045172ed7d1eebca47cf'
         '96ec9d0a5a8bd4710ea563da026335ec'
         '88abae5bf17e539e4ee5a5f666f56cf4'
         'a3f7cb96cddd19337a628689820bb88f')

_svntrunk=svn://svn.mplayerhq.hu/mplayer/trunk
_svnmod=mplayer

_ffmpeggitroot="git://git.videolan.org/ffmpeg.git"
_ffmpeggitname="ffmpeg"


prepare() {
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
}


build() {
  cd "$srcdir/$_svnmod-build"

  # Applying some patches...
  for patch in ../p1-*.patch; do
    msg "Applying p1 `basename $patch`..."
    patch -Np1 -i $patch
  done
  for patch in ../p0-*.patch; do
    msg "Applying p0 `basename $patch`..."
    patch -Np0 -i $patch
  done

  # Use the mplayer's configure script autodetection.
  # GUI is disabled by default, most options are autodetected.
  # Make sure you have the related package (ex: lirc) before building.
  # go in source and run ./configure --help to see what's enabled/disabled by default
  # for GUI add '--enable-gui'
  # for Joystick add '--enable-joystick'

  # Custom FLAGS break the mplayer build
  unset CFLAGS LDFLAGS

  # If you experience problems with mkvs, try to add the following option
  # to configure '--extra-cflags=-fno-strict-aliasing'

  ./configure --prefix=/usr --confdir=/etc/mplayer --language=all --enable-ass-internal --enable-menu --enable-freetype --enable-mencoder || return 1

  [ "$CARCH" == "i686" ] && sed 's|-march=i484|-march=i686|g' -i config.mak

  make || return 1
}







package() {
  cd "$srcdir/$_svnmod-build"
  
  make DESTDIR="$pkgdir/" install || return 1

  install -Dm644 etc/{codecs.conf,dvb-menu.conf,example.conf,input.conf,menu.conf} $pkgdir/etc/mplayer/ || return 1
  install -dm755 $pkgdir/usr/share/mplayer/ || return 1
  install -m644 etc/mplayer{.desktop,.ico,{16x16,22x22,24x24,32x32,48x48,256x256}.png} $pkgdir/usr/share/mplayer/ || return 1
  install -m644 disabled_features $pkgdir/etc/mplayer/ || return 1
  install -m644 $srcdir/mplayer.conf $pkgdir/etc/mplayer/ || return 1
}





