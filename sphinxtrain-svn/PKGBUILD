# Contributor: Sitalo Vladislav <root@stvad.org>

pkgname=sphinxtrain-svn
pkgver=11473
pkgrel=1
pkgdesc="SphinxTrain - tool for creating CMU Sphinx models"
arch=(i686 x86_64)
url="http://cmusphinx.sourceforge.net"
license=('CMU')
depends=('gcc' 'sphinxbase-svn' 'python2' 'perl')
makedepends=('subversion')
provides=(sphinxtrain)
conflicts=(sphinxtrain)
md5sums=() #generate with 'makepkg -g'

_svntrunk=https://cmusphinx.svn.sourceforge.net/svnroot/cmusphinx/trunk/SphinxTrain

_svnmod=SphinxTrain



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
