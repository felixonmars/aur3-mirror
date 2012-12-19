# Maintainer: Unnikrishnan <unnikrishnan.a@gmail.com>
     
pkgname=imdbmoviefetcher
pkgver=4.2
pkgrel=1
pkgdesc="command line tool to search and get information about movies"
arch=('any')
url="http://prj.mutexes.org/projects/imdbmoviefetcher"
license=('GPL')
depends=('lynx')
source=(http://download.sourceforge.net/project/imdbmoviefetche/$pkgname-v$pkgver.tar.gz)
md5sums=('97095057a41a644243485715e2136a72')
     
build() 
{
      install -Dm755 "$srcdir/$pkgname/imdb-mf.sh" "$pkgdir/usr/bin/imdb-mf"
      install -Dm644 "$srcdir/$pkgname/imdb-mf.conf" "$pkgdir/etc/imdb-mf.conf"
}
