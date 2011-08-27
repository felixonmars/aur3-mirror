# Maintainer: Gen2ly <dirk.r.gently@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kdemultimedia-kmix-oss-svn
pkgver=1033794
pkgrel=1
pkgdesc="Sound Mixer with OSSv4 support (experimental)"
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
groups=('kde' 'kdemultimedia')
install='kdemultimedia.install'
depends=('automoc4' 'cmake' 'kdelibs-experimental' 'kdebase-runtime')
makedepends=('subversion')
conflicts=('kdemultimedia-kmix')
provides=('kdemultimedia-kmix')
source=()

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdemultimedia
_svnmod=kdemultimedia

build() {
  cd "$srcdir"

  if [ -d $_svnmod-build/.svn ]; then
    msg "Connecting to SVN server to update..."
    (cd $_svnmod-build && svn up -r $pkgver)
  else
    msg "Connecting to SVN server to get sources..."
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod-build
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $srcdir/$_svnmod-build
  cmake \
    -DBUILD_dragonplayer=OFF \
    -DBUILD_juk=OFF \
    -DBUILD_kioslave=OFF \
    -DBUILD_kscd=OFF \
    -DBUILD_libkcddb=OFF \
    -DBUILD_libkcompactdisc=OFF \
    -DBUILD_libkdemultimedia=OFF \
    -DBUILD_strigi-analyzer=OFF \
    -DBUILD_mplayerthumbs=OFF \
    -DCMAKE_BUILD_TYPE=Testing \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_{SHARED,MODULE,EXE}_LINKER_FLAGS='-Wl,--no-undefined -Wl,--as-needed' \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DWITH_Xine=OFF \
    -DWITH_PulseAudio=OFF
  make
  # Put together kmix
  cd $srcdir/$_svnmod-build/kmix
  make DESTDIR=$pkgdir install
  cd $srcdir/$_svnmod-build/doc/kmix
  make DESTDIR=$pkgdir install
}

md5sums=()
md5sums=()
md5sums=()
md5sums=()
