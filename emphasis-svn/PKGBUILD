# Contributor: Reverie <reverie@takhis.net>

arch=(i686 x86_64)
pkgname=emphasis-svn
pkgver=35554
pkgrel=1
pkgdesc="Music player daemon (MPD) client written in etk"
url="http://www.enlightenment.org"
license="GPL"
depends=('enhance-svn' 'libmpd')
makedepends=('subversion')
conflicts=('emphasis')
provides=('emphasis')
replaces=('emphasis-cvs')
source=()
md5sums=()

_svntrunk=http://svn.enlightenment.org/svn/e/trunk/emphasis
_svnmod=emphasis

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg/ install

  rm -rf $startdir/src/$_svnmod-build
}

# vim:syntax=sh