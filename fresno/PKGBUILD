# Contributor: Matthias Küch mail<ät>matthias-kuech<döt>de
# Maintainer: Matthias Küch mail<ät>matthias-kuech<döt>de
pkgname=fresno
pkgver=7359
pkgrel=1
pkgdesc="Command line control for Firefox - MozREPL needed"
arch=('i686' 'x86_64')
url="http://simile.mit.edu/wiki/Fresno"
license=('GPL')
makedepens=('subversion')
depends=('firefox')
install=fresno.install

_svntrunk='http://simile.mit.edu/repository/fresno/trunk'
_svnmod=$pkgname
build() {

cd $srcdir

  if [ -d $_svnmod/.svn ]; then
     (cd $_svnmod && svn up -r $pkgver)
   else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
     
       msg "SVN checkout done or server timeout"
       msg "Starting ant..."

       cd $_svnmod
       
       
       install -Dm 755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

