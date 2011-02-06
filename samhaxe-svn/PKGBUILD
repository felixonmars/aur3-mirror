# -*- shell-script -*-
#
# $Id$
#
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>

name=samhaxe
pkgname=$name-svn
pkgver=23
pkgrel=1
pkgdesc="a flash resource assembly tool similar to swfmill"
arch=('i686' 'x86_64')
url="http://mindless-labs.com/trac/$name"
license=('MIT')
depends=('neko' 'imagemagick' 'freetype2')
makedepends=('apache-ant' 'gcc' 'haxe' 'subversion')
options=('!strip')

source=('config.ant')
md5sums=('5827e261ea7ef353de1f9689395887af')

_svntrunk="http://mindless-labs.com/svn/$name/trunk"
_svnmod=$name

# before build export env like below (as described in haxe install)
#
# HAXE_HOME=/opt/haxe
# HAXE_LIBRARY_PATH=/opt/haxe/std:.

build() {
  cd $srcdir

  msg "Connecting to $_svntrunk SVN server...."
  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod && svn up -r $pkgver || return 1
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod || return 1
  fi

  msg "SVN checkout done"
  msg "Starting make..."

  cd $srcdir/$name
  ln -sf $startdir/config.ant ./
  ant || return 1

  cd $srcdir/$name/bin

  install -d $pkgdir/etc
  install -m 644 samhaxe.conf.xml $pkgdir/etc/
  sed -i -e 's/<modules path=".*/<modules path="\/usr\/lib\/samhaxe\/modules">/' $pkgdir/etc/samhaxe.conf.xml

  install -d $pkgdir/usr/bin
  install -m 755 SamHaXe $pkgdir/usr/bin/samhaxe

  install -d $pkgdir/usr/lib/samhaxe/modules/native
  install -m 644 modules/*.n $pkgdir/usr/lib/samhaxe/modules/
  install -m 755 modules/native/*.ndll $pkgdir/usr/lib/samhaxe/modules/native/
}
