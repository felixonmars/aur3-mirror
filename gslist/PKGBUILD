# Contributor: rabyte <rabyte__gmail>
# Contributor: cs-cam - me.at.camdaniel.com
# Contributor: cdhotfire<cdhotfire@gmail.com>
# Contributor: gerryAU <gnuscar@gmail.com>

pkgname=gslist
pkgver=0.8.8b
pkgrel=1
pkgdesc="A game servers browser with support for over 1000 games"
arch=('i686' 'x86_64')
url="http://aluigi.altervista.org/papers.htm#gslist"
license=('GPL2')
depends=('geoip' 'libmysqlclient')
source=(http://aluigi.altervista.org/papers/gslist.zip)
md5sums=('fd9951c23348e0936709dbc6cccb7ace')

build (){
  cd $srcdir/$pkgname

  make clean
  make CFLAGS="${CFLAGS}" || return 1
  make PREFIX=$pkgdir/usr install
}
