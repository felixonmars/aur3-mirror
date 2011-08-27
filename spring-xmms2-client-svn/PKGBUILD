# Contributor: Gereon Schomber
pkgname=spring-xmms2-client-svn
pkgver=9
pkgrel=1
pkgdesc="A Qt4 client for xmms2 written in Python"
arch=(any)
url="http://my-trac.assembla.com/spring/"
license=('GPL')
groups=()
depends=('python' 'qt' 'xmms2' 'pyqt')
makedepends=('subversion')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
#source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=http://my-svn.assembla.com/svn/spring/trunk
_svnmod=spring

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
 
  cd $srcdir/$_svnmod
  mkdir -p $pkgdir/{opt/spring,usr/bin} 
  cp -r * $pkgdir/opt/spring
  cd $pkgdir/usr/bin
  ln -s -T /opt/spring/spring.py $pkgdir/usr/bin/spring-player
}
