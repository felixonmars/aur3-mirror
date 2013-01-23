# Contributor: Jinx <Jinxware[at]gmail[dot]com>

pkgname=sipvicious-svn
pkgver=441
pkgrel=1
pkgdesc="Tools for auditing SIP devices"
arch=('i686' 'x86_64')
url="http://blog.sipvicious.org"
license=('GPLv2')
depends=('python2')
makedepends=('subversion')
install="post.install"

_svntrunk="http://sipvicious.googlecode.com/svn/trunk"
_svnmod="$pkgname"

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting to build package..."
}

package() {
	rm -rf "$srcdir/$pkgname/.svn"
	install -d -m 755 "$pkgdir/usr/bin"
	install -d -m 755 "$pkgdir/usr/share"
	install -d -m 755 "$pkgdir/usr/share/man"

	cd "$srcdir/$pkgname"
	chmod 755 *.py
	sed -i "s:/usr/bin/env python:/usr/bin/env python2:" *.py
	mv "$srcdir/$pkgname/man1" "$pkgdir/usr/share/man"
	mv "$srcdir/$pkgname" "$pkgdir/usr/share/sipvicious"
}
