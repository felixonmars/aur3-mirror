# Contributor: Adrian Carpenter <adriatic.c@gmail.com>
pkgname=echo-nest-remix-svn
pkgver=442
pkgrel=1
pkgdesc="echonest is the internet synthesizer that lets you make things with music and video"
arch=('i686' 'x86_64')
url="http://code.google.com/p/echo-nest-remix/"
license=('BSD')
depends=('python>=2.5' 'python<3.0' 'python-numpy' 'ffmpeg' 'youtube-dl')
makedepends=('subversion')
source=()
install=echo-nest-remix-svn.install
md5sums=() 

_svntrunk=http://echo-nest-remix.googlecode.com/svn/trunk/
_svnmod=echo-nest-remix-read-only

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
  sed -i 's|^\s*data_files.*||' setup.py
  mkdir -p $pkgdir/usr/share
  cp -a examples $pkgdir/usr/share/$pkgname

  python setup.py install --root=$pkgdir/
}
# vim:set ts=2 sw=2 et:
