# Maintainer:yugrotavele <yugrotavele at archlinux dot us>
# Contributor:Juergen Graefe <jg72@arcor.de>

pkgname=slrn-svn
pkgver=327
pkgrel=2
pkgdesc="A highly customizable text-based newsreader"
arch=('i686' 'x86_64')
url="http://www.slrn.org/"
license=('GPL')
depends=('openssl' 'slang')
makedepends=('subversion' 'uudeview')
optdepends=('metamail')
options=('!makeflags' 'docs' 'zipman')
backup=(etc/slrnrc)
provides=('slrn-svn')
conflicts=('slrn')
install=${pkgname}.install

_svntrunk=https://slrn.svn.sourceforge.net/svnroot/slrn/trunk
_svnmod=slrn

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
    ./configure --prefix=/usr --sysconfdir=/etc \
	--enable-setgid-code \
	--with-slrnpull --with-ssl --with-uu \
	--with-uulib=/usr/lib/uudeview \
	--with-uuinc=/usr/include/uudeview \
	--enable-spoilers
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir" install
  install -Dm 755 contrib/cleanscore $pkgdir/usr/bin/cleanscore
  install -Dm 644 doc/slrn.rc $pkgdir/etc/slrnrc
}
