# Contributor: totoloco <totoloco en gmail>
pkgname=xdebug-svn
pkgver=3228
pkgrel=1
pkgdesc="PHP debugging extension. svn version"
arch=('i686' 'x86_64')
url="http://www.xdebug.org"
license=('GPL')
depends=('php')
makedepends=('subversion' 'php')
provides=('xdebug')
conflicts=('xdebug')
replaces=('xdebug')
source=('xdebug.ini' 'xdebug-5.2.ini')
backup=('etc/php/conf.d/xdebug.ini')
md5sums=('e1e4958f0f50dc12e8204933719ea972'
         '3a9913978c0977ab6bb14997af5d8b49')

_svntrunk=svn://svn.xdebug.org/svn/xdebug/xdebug/trunk
_svnmod=xdebug
install="${_svnmod}.install"

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
  local PHPVER=$(php -r 'echo phpversion();')
  
  phpize || return 1
  ./configure --prefix=/usr --enable-xdebug || return 1
  make || return 1

  cd debugclient || return 1
  ./buildconf
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  
  cd $srcdir/${_svnmod}-build || return 1
  if [ "$PHPVER" \< "5.3.0" ] ; then
    install -D -m 744 modules/xdebug.so $pkgdir/usr/lib/php/xdebug.so || return 1
    install -D -m 644 $startdir/xdebug-5.2.ini $pkgdir/etc/php/conf.d/xdebug.ini || return 1
  else
    install -D -m 744 modules/xdebug.so $pkgdir/usr/lib/php/modules/xdebug.so || return 1
    install -D -m 644 $startdir/xdebug.ini $pkgdir/etc/php/conf.d/xdebug.ini || return 1
  fi
}
