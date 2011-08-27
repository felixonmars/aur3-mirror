# Contributor: Roman Timushev <romikt@gmail.com>
pkgname=inputlircd-svn
pkgver=13
pkgrel=1
pkgdesc="Inputlirc daemon to utilize /dev/input/event*"
arch=(i686 x86_64)
url="http://svn.sliepen.eu.org/inputlirc/trunk"
license=('GPL')
makedepends=(subversion)
source=(inputlircd.conf
        inputlircd.init)
md5sums=('9dbd441ab206fec3822fa95bade8a616'
         '1d67b170c3244258e37562eaa974e48d')

_svntrunk=http://svn.sliepen.eu.org/inputlirc/trunk
_svnmod=inputlircd

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
  make || return 1
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
  install -D -m644 ../inputlircd.conf "$pkgdir/etc/conf.d/inputlircd"
  install -D -m755 ../inputlircd.init "$pkgdir/etc/rc.d/inputlircd"
}
