# Contributor: totoloco <totoloco at gmail dot com>

pkgname=rss2html-hg
pkgver=2
pkgrel=1
pkgdesc="Convert RSS feeds to plain text, html or token-separated strings."
arch=('i686' 'x86_64')
url="http://nopcode.org/wk.php/rss2html"
license=('GPL')
depends=('curl')
md5sums=()
provides=('rss2html')
replaces=('rss2html')
conflicts=('rss2html')

_hgroot='http://hg.youterm.com'
_hgrepo='rss2html'

build() {
  cd $srcdir

  if [ -d $_hgrepo ]; then
   	cd $_hgrepo
    hg pull -u
  else
    hg clone ${_hgroot}/${_hgrepo}
  fi

  [ -d $srcdir/$_hgrepo-build ] && rm -Rf $srcdir/$_hgrepo-build
  cp -R $srcdir/$_hgrepo $srcdir/$_hgrepo-build
  cd $srcdir/$_hgrepo-build
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install
  mkdir -p $pkgdir/usr/man/man1/
  make PREFIX=$pkgdir/usr BINDIR=$pkgdir/usr/bin MANDIR=$pkgdir/usr/man install
}

