# Maintainer: Juan Diego Tascon
# Contributor: Denis Zawada <deno@rootnode.net>
# Contributor: Jordy van Wolferen <jordz@archlinux.us>

pkgname=periscope-svn
pkgver=155
pkgrel=3
pkgdesc="Subtitles searching module written in python."
url="http://code.google.com/p/periscope/"
arch=('any')
license=('GPL3')
depends=('python2-beautifulsoup3' 'python2-notify')
makedepends=('subversion' 'python2-distribute')
provides=('periscope')

_svntrunk=http://periscope.googlecode.com/svn/trunk/
_svnmod=periscope-read-only

build() {
  cd "$srcdir"
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build/
  
  python2 ./setup.py build
  python2 ./setup.py install --root="$pkgdir"
  
  rm -rf "$srcdir/$_svnmod-build"
}
