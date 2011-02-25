# Contributor: Link Dupont <link.dupont@gmail.com>
# Maintainer: Link Dupont <link.dupont@gmail.com>
pkgname=xbtt-svn
pkgver=2078
pkgrel=1
pkgdesc="XBT Tracker is a BitTorrent tracker written in C++"
arch=('x86_64' 'i686')
url="http://xbtt.sourceforge.net/tracker/"
license=('GPL')
groups=()
depends=('libmysqlclient')
makedepends=('subversion' 'boost')
provides=('xbtt')
conflicts=('xbtt')
backup=('etc/xbt_tracker.conf')
options=()
install=xbtt.install
source=('xbt_tracker.rc' 'README')
noextract=()
md5sums=('69c0928877c721b3ba0a4797e8380dfe'
         'ca8be653f32dfea4c61994bd067ad90e')

_svntrunk=https://xbtt.svn.sourceforge.net/svnroot/xbtt/trunk
_svntrackermod=xbt/Tracker
_svnmiscmod=xbt/misc

build() {
  cd "$srcdir"

  if [ -d $_svntrackermod/.svn ]; then
    (cd $_svntrackermod && svn up -r $pkgver)
  else
    svn co $_svntrunk/$_svntrackermod --config-dir ./ -r $pkgver $_svntrackermod
  fi

  if [ -d $_svnmiscmod/.svn ]; then
    (cd $_svnmiscmod && svn up -r $pkgver)
  else
    svn co $_svntrunk/$_svnmiscmod --config-dir ./ -r $pkgver $_svnmiscmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svntrackermod-build"
  cp -r "$srcdir/$_svntrackermod" "$srcdir/$_svntrackermod-build"
  cd "$srcdir/$_svntrackermod-build"

  #
  # BUILD
  #
  ./make.sh
  install -m 755 -o root -g root -d $pkgdir/usr/bin $pkgdir/etc $pkgdir/etc/rc.d $pkgdir/usr/share/doc/$pkgname
  install -m 755 -o root -g root xbt_tracker $pkgdir/usr/bin
  install -m 644 -o root -g root -T xbt_tracker.conf.default $pkgdir/etc/xbt_tracker.conf
  install -m 755 -o root -g root -T $srcdir/xbt_tracker.rc $pkgdir/etc/rc.d/xbtt
  install -m 644 -o root -g root $srcdir/xbt/Tracker/xbt_tracker.sql $pkgdir/usr/share/doc/$pkgname
  install -m 644 -o root -g root $srcdir/README $pkgdir/usr/share/doc/$pkgname
}
