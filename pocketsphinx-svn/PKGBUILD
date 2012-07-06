# Contributor: Sitalo Vladislav <root@stvad.org>

pkgname=pocketsphinx-svn
pkgver=11445
pkgrel=2
pkgdesc="Pocketsphinx is a library which is designed to ease the use of CMU SPHINX speech recognizer functionality in your applications"
arch=(i686 x86_64)
url="http://cmusphinx.sourceforge.net"
license=('CMU')
depends=('gcc' 'sphinxbase-svn')
makedepends=('subversion')
provides=(pocketsphinx)
conflicts=(pocketsphinx)
md5sums=() #generate with 'makepkg -g'

_svntrunk=https://cmusphinx.svn.sourceforge.net/svnroot/cmusphinx/trunk/pocketsphinx
_svnmod=pocketsphinx



build() {


cd "$srcdir"


  msg "getting $_svnmod"
if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi  
  
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

cd $srcdir/$_svnmod 
./autogen.sh --prefix=/usr
make || return 1    
mkdir -p "$pkgdir/usr/lib/python2.6/site-packages"
export PYTHONPATH=$PYTHONPATH:$pkgdir/usr/lib/python2.6/site-packages || return 1
make DESTDIR="$pkgdir" install || return 1

}
