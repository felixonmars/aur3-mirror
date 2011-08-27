# Contributor: totoloco <totoloco at gmail dot com>
pkgname=gozerbot-svn
pkgver=236
pkgrel=1
pkgdesc="gozerbot a python irc and jabber bot"
arch=('i686' 'x86_64')
url="http://www.gozerbot.org/"
license=('BSD')
depends=('python')
provides=('gozerbot')
replaces=('gozerbot')
conflicts=('gozerbot')
source=()
md5sums=()

_svntrunk=http://gozerbot.googlecode.com/svn/trunk/
_svnmod=gozerbot

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
  cd $srcdir/$pkgname-$pkgver
  cp -v $srcdir/setup.cfg .
  python setup.py install --root=$pkgdir
  mkdir -p $pkgdir/usr/man/man1
  cp -v $srcdir/$_svnmod/man/$_svnmod.1 $pkgdir/usr/man/man1
}
