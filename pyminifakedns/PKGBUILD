# Contributor: Dan Serban

pkgname=pyminifakedns
pkgver=0.1
pkgrel=1
pkgdesc="Minimal DNS server written in Python; it always replies with a 127.0.0.1 A-record"
arch=(any)
url="http://code.activestate.com/recipes/491264/"
license=(PSF)
depends=(python2)
source=(pyminifakedns.py pyminifakedns.sh)
md5sums=('d228c23ede169972aa74cb7724ab5f0e'
         'b307b8bae776587b74d41f77922ab776')

build()
{
  cd $srcdir
  install -Dm755 pyminifakedns.sh $pkgdir/usr/bin/pyminifakedns
  install -Dm755 pyminifakedns.py $pkgdir/usr/share/pyminifakedns/pyminifakedns.py
}
