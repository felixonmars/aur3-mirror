# Contributor: twa022 <twa022 at gmail dot com>

pkgname=enjoy-svn
pkgver=57843
pkgrel=1
pkgdesc="Lightweight Music Player using EFL"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3')
depends=('e_dbus-svn' 'elementary-svn' 'efreet-svn' 'emotion-svn' 'lightmediascanner')
makedepends=('subversion')
options=('!libtool')
install=($pkgname.install)
source=(http://garage.maemo.org/frs/download.php/9439/lightmediascanner-0.4.3.0.tar.bz2)
md5sums=('188ff5188cfa0f2504a42934c969cb77')

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/enjoy"
_svnmod="enjoy"

build() {
  cd $srcdir

  if [ $NOEXTRACT -eq 0 ]; then
    msg "Connecting to $_svntrunk SVN server...."
    if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up -r $pkgver)
    else
      svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

  fi
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  ./autogen.sh --prefix=/usr 
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  rm -r $startdir/src/$_svnmod-build
  
  cd $srcdir/lightmediascanner-0.4.3.0
  ./configure --prefix=/usr || return 1
  make || return 1
  install -Dm755 $srcdir/lightmediascanner-0.4.3.0/src/bin/test \
                 $pkgdir/usr/bin/lightmediascanner-generate-database
}
