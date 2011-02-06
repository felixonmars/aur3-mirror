# Contributor: Abdallah Aly <l3thal8 @gmail.com>
# Oss verison: Mathias L. Baumann <marenz@supradigital.org>
pkgname=sphinxbase-svn-oss
pkgver=9788
pkgrel=4
pkgdesc="the basic libraries shared by the CMU Sphinx trainer and all the Sphinx decoders"
arch=(i686 x86_64)
url="http://cmusphinx.sourceforge.net"
license=('CMU')
depends=('gcc' 'bison')
makedepends=('subversion')
provides=(sphinxbase)
conflicts=(sphinxbase)
source=(configure.in.oss.patch)

_svntrunk=https://cmusphinx.svn.sourceforge.net/svnroot/cmusphinx/trunk/sphinxbase
_svnmod=sphinxbase



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
#make it use oss
patch < ../../configure.in.oss.patch
./autogen.sh --prefix=/usr
make || return 1
make check || return 1
mkdir -p "$pkgdir/usr/lib/python2.6/site-packages"
export PYTHONPATH=$PYTHONPATH:$pkgdir/usr/lib/python2.6/site-packages || return 1
make DESTDIR="$pkgdir" install || return 1

mkdir -p "$pkgdir/usr/share/licenses/cmu/"
cp $srcdir/$_svnmod/LICENSE $pkgdir/usr/share/licenses/cmu

# resolve conflict with setuptools
rm $pkgdir/usr/lib/python2.6/site-packages/site.{py,pyc}

}
md5sums=('62f76105aa6eb9e09bcf760e2a167d9c')
