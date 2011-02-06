# Contributor: royrocks <royrocks13@gmail.com>

pkgname=gstfakevideo
pkgver=3
pkgrel=1
pkgdesc="Simple user-space video driver, which creates fake video source from gstreamer pipeline defined in command line."
arch=(i686)
url="http://mrk.sed.pl/node/22/"
license=('GPL')
depends=('gstreamer0.10' 'skype>=2.0.0.13')
makedepends=('subversion')
source=()
md5sums=()

_svntrunk=http://gstfakevideo.googlecode.com/svn/trunk
_svnmod=gstfakevideo

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  rm -r $startdir/src/$_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  install -d -m644 $startdir/pkg/usr/bin/
  install -d -m644 $startdir/pkg/usr/lib/
  make PREFIX=/usr || return 1
  make PREFIX=$startdir/pkg/usr install || return 1 
}

