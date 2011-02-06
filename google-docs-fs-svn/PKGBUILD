# Contributor: Tocer Deng <tocer.deng@gmail.com>
#Contributor: Tom Tryfonidis <tomtryf at gmail dot com>
pkgname=google-docs-fs-svn
_realname=google-docs
pkgver=128
pkgrel=1
pkgdesc="allow you to connect to Google Docs and treat it as a file system"
arch=('i686' 'x86_64')
url="http://code.google.com/p/google-docs-fs/"
license=('GPL2')
depends=('python>=2.5' 'python-fuse>=0.2' 'python-gdata>=1.3')
makedepends=('subversion')
conflicts=('google-docs-fs')
_svntrunk=http://google-docs-fs.googlecode.com/svn/trunk/
_svnmod=google-docs-fs
md5sums=()

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

  python2 setup.py install --root=$pkgdir --optimize=1 || return 1
}


# vim:set ts=2 sw=2 et:
