# Contributor: Lukas Sabota <punkrockguy318@comcast.net>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: nikron nikron<at>nikron<dot>net
# Maintainer: Jonathan Conder <jonno dot conder at gmail dot com>

pkgname=mediatomb-svn
pkgver=2103
pkgrel=1
pkgdesc="Free UPnP/DLNA media server"
arch=('i686' 'x86_64')
url="http://mediatomb.cc/"
license=('GPL')
depends=('js' 'libexif' 'taglib' 'sqlite3' 'curl' 'ffmpegthumbnailer')
makedepends=('subversion')
conflicts=('mediatomb')
provides=('mediatomb=0.12.1')
backup=('etc/conf.d/mediatomb')
source=('mediatomb.rc'
        'mediatomb.conf'
        'libmp4v2_handler.cc.patch'
	'gcc46.patch'
	'tonewjs.patch'
	'libav_0.7_support.patch')
md5sums=('4ad9a7d76b909d2c2220c65479a86043'
         'bec297e4178332a26b42bbde873b94cd'
         '9e3ed6c1f94b2b392fd8f15e4d0930f6'
	 '0ae34c0d73b76e3d215887834c3c08cf'
	 '03c446b29ec62e27e94fd85e142f3379'
	 '88144653ff2dc602bcb737f59b2421ce')

_svntrunk="https://mediatomb.svn.sourceforge.net/svnroot/mediatomb/trunk/mediatomb"
_svnmod='mediatomb'

build() {
  cd "$srcdir"

  if [ -d "$_svnmod/.svn" ]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$_svnmod" "$_svnmod-build"
  cd "$_svnmod-build"

  patch 'src/metadata/libmp4v2_handler.cc' < "$srcdir/libmp4v2_handler.cc.patch"
  patch -Np1 -i "$srcdir/gcc46.patch"
  patch -Np1 -i "$srcdir/tonewjs.patch"
  patch -Np1 -i "$srcdir/libav_0.7_support.patch"

  autoreconf -i
  ./configure --prefix=/usr \
              --disable-mysql \
              --enable-libmagic \
              --enable-libjs \
              --enable-ffmpeg
  make || bash
}

package() {
  cd "$srcdir/$_svnmod-build"

  make DESTDIR="$pkgdir/" install

  install -D -m0755 "$srcdir/mediatomb.rc" "$pkgdir/etc/rc.d/mediatomb"
  install -D -m0755 "$srcdir/mediatomb.conf" "$pkgdir/etc/conf.d/mediatomb"
  mkdir -p "$pkgdir/var/lib/mediatomb"
}
