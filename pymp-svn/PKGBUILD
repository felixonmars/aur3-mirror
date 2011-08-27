pkgname=pymp-svn
pkgver=754
pkgrel=1
url="http://jdolan.dyndns.org/trac/wiki/Pymp"
pkgdesc="PyGTK frontend for MPlayer"
depends=('mplayer' 'pygtk')
makedepends=('svn')
conflicts=('pymp')
source=(pymp.desktop)
arch=('i686' 'x86_64')
md5sums=('eb63f882bb403320989288c25bfe05da')
license=('GPL')

_svntrunk=svn://jdolan.dyndns.org/pymp
_svnmod=pymp

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
  cd "$srcdir/$_svnmod-build/trunk"

  #
  # BUILD
  #
	
	for file in *
	do
		sed -i 's/python/python2/g' ${file}
	done

	make || return 1
	make DESTDIR=$pkgdir PREFIX=/usr install
	install -D -m644 $srcdir/$_svnmod.desktop \
        $pkgdir/usr/share/applications/$_svnmod.desktop || return 1
}
