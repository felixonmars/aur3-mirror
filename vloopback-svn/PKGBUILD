# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Artiom MOLCHANOV

_name=vloopback
_kver=`uname -r | sed 's/\..-.//'`
pkgname=$_name-svn
pkgver=24
pkgrel=3
pkgdesc="The video4linux loopback device is a device driver that generates video pipes."
arch=('i686' 'x86_64')
url="http://www.lavrsen.dk/twiki/bin/view/Motion/VideoFourLinuxLoopbackDevice"
license=('GPL')
depends=('v4l-utils')
makedepends=('subversion' 'linux-headers')
provides=("$_name")
conflicts=("$_name")
install="$pkgname.install"
source=("libv4l1-videodev.h")
md5sums=('7eda710e3032c0fe27d2063e2d0b51eb')

_svntrunk=http://www.lavrsen.dk/svn/vloopback/trunk/
_svnmod=$_name

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #

  # use patched libv4l1-videodev.h
  cp ../libv4l1-videodev.h .

  # build using v4l-utils headers
  sed -i 's/<linux\/\(videodev.h\)>/"libv4l1-\1"/' \
    $_name.c example/*.c

  # remove old API
  sed -e '/CONFIG_VIDEO_V4L1_COMPAT/,+2d' \
      -e 's/BASE_VIDIOCPRIVATE/192/' \
      -e '/VIDIOCGUNIT:/,+18d' \
      -e '/VIDIOCKEY/,+1d' \
      -i $_name.c example/dummy.c

  # examples makefile fix
  sed -i "s|/usr/sbin|$pkgdir/usr/bin|g" example/Makefile

  make EXTRA_CFLAGS="-I."
}

package() {
  cd "$srcdir/$_svnmod-build"

  # module
  install -Dm644 vloopback.ko \
    "$pkgdir/usr/lib/modules/extramodules-$_kver/$_name.ko"

  # docs and examples
  install -d "$pkgdir"/usr/{bin,share/doc/$_name}
  install -Dm644 FAQ README $_name.html "$pkgdir/usr/share/doc/$_name"
  cd example && make install
}
