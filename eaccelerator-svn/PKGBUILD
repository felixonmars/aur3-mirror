# Contributor: smallcms <smallcms at mail dot ru>

pkgname=eaccelerator-svn
pkgver=411
pkgrel=1
pkgdesc="eAccelerator is a free open-source PHP accelerator, optimizer, and dynamic content cache."
arch=('i686' 'x86_64')
url="http://eaccelerator.net/"
license=('GNU General Public License')
depends=('php')
makedepends=('autoconf' 'automake' 'libtool' 'm4 ' 'svn')
conflicts=('xcache' 'turck-mmcache' 'phpexpress' 'eaccelerator')
source=()
md5sums=()

_svnuser=anonymous
_svnpass=anonymous
_svntrunk="http://dev.eaccelerator.net/eaccelerator/trunk/ --username ${_svnuser} --password ${_svnpass}"
_svn_up="svn --username ${_svnuser} --password ${_svnpass} up"
#svntrunk="http://dev.eaccelerator.net/eaccelerator/branches/0.9.5/ --username ${_svnuser} --password ${_svnpass}"
_svnmod=trunk

build() {
 msg "Connecting to eaccelerator.net SVN server..."
 cd $srcdir
 if [ -d $_svnmod/.svn ]; then
   (cd $_svnmod && $_svn_up)
 else
    svn co $_svntrunk
 fi
 msg "SVN checkout done or server timeout"

 cd $srcdir
 rm -rf $_svnmod-build
 cp -rf $_svnmod $_svnmod-build
 
 msg "Starting make..."  
 cd $srcdir/$_svnmod-build 

  phpize
  ./configure --prefix=/usr
  make || return 1
  make INSTALL_ROOT=$pkgdir install || return 1
  mkdir -p $pkgdir/etc/php/conf.d/ || return 1
  mkdir -p $pkgdir/var/cache/eaccelerator || return 1
  chmod 777 $pkgdir/var/cache/eaccelerator || return 1
  cat $srcdir/$_svnmod/eaccelerator.ini | gawk 'gsub("eaccelerator.cache_dir = \"/tmp/eaccelerator\"","eaccelerator.cache_dir = \"/var/cache/eaccelerator\"")1' > $pkgdir/etc/php/conf.d/eaccelerator.ini || return 1

rm -rf $srcdir/$_svnmod-build

}

