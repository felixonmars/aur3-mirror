# contributor: Roel Blaauwgeers <roel at ttys0.nl>

pkgname=nikto-svn
pkgver=693
pkgrel=1
pkgdesc="'A web server scanner which performs comprehensive tests against web servers for multiple items'"
arch=('i686' 'x86_64')
url="http://www.cirt.net/nikto2"
license=('GPL')
depends=('perl' 'openssl' 'perl-net-ssleay')
makedepends=('subversion')
provides=()
conflicts=('nikto')
source=(nikto.sh)
md5sums=('eb7b704c8bdae28af9a0353764d0b552') 

_svntrunk="http://svn2.assembla.com/svn/Nikto_2/trunk/"
_svnmod=nikto

build() {


  if [ -d $srcdir/.svn ]; then
    msg 'Updating...'
    svn up $srcdir
  else
    msg 'Checking out...'
    svn co $_svntrunk $srcdir
  fi


  cd $srcdir

  install -d $pkgdir/usr/share/nikto
  cp -a * $pkgdir/usr/share/nikto/
  find $pkgdir/usr/share/nikto -type f -exec chmod 644 {} +
  install -Dm 755 $srcdir/nikto.sh $pkgdir/usr/bin/nikto
}

#BUILD


