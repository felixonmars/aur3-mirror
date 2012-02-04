# Contributor: Michael Krauss <hippodriver@gmx.net>

pkgname=codeville
pkgver=0.8.0
pkgrel=1 
pkgdesc="Codeville is a distributed version control system" 
url="http://codeville.org/" 
depends=('python>=2.3' 'db>=4.1') 
license=('BSD')
arch=('x86_64')
backup=('etc/cdvserver.conf')
source=(http://codeville.org/download/Codeville-$pkgver.tar.gz)
md5sums=('86d466d14fb31168236397b0caf3498f')

build() 
{ 
  # Install
  cd $startdir/src/Codeville-$pkgver
  python setup.py install --prefix=/usr --root=${startdir}/pkg || return 1
  # prepare directory for the codeville repository
  mkdir -p $startdir/pkg/var/lib/cdvserver
  # config file and init script
  mkdir -p $startdir/pkg/etc/rc.d
  install --mode=644 cdvserver.conf.sample $startdir/pkg/etc/cdvserver.conf || return 1
  install --mode=755 $startdir/cdv $startdir/pkg/etc/rc.d/
  # License stuff
  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname 
  cp $startdir/COPYING $startdir/pkg/usr/share/licenses/$pkgname || return 1
  # man pages
  mkdir -p $startdir/pkg/usr/share/man/man1 || return 1
  install --mode=644 $startdir/codeville.1.gz \
    $startdir/pkg/usr/share/man/man1 || return 1
  install --mode=644 $startdir/cdvserver.1.gz \
    $startdir/pkg/usr/share/man/man1 || return 1
  install --mode=644 $startdir/cdv.1.gz \
    $startdir/pkg/usr/share/man/man1 || return 1
} 


