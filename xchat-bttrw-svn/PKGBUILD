# Contributor: Tomas Kopecny aka Georgo10 <georgo10@gmail.com>
# To create package use versionpkg instead makepkg !
# If you use makepkg, you will donwload 527 version.

pkgname=xchat-bttrw-svn
pkgver=527
pkgrel=1
pkgdesc="IRC gate to access czech web chat - Xchat.cz"
url="http://nomi.cz/projects.shtml?id=xchat-bttrw"

depends=('bash')
makedepends=('subversion' 'versionpkg')
conflicts=('xchat-bttrw')
replaces=('xchat-bttrw')
provides=('xchat-bttrw')

source=(init-script xchat-bttrw-svn.install xchat-bttrw.conf)
md5sums=('675be900a1993a1c90ffa4f5b50a26e3' 'a074dd49a0f523a7aea79cfd55174fd8'\
         '69a9667427361c7fb3b9b20ba38cb3d8')
	 
install=(xchat-bttrw-svn.install)

_svntrunk=http://svn.nomi.cz/svn/tomi/xchat-bttrw/head
_svnmod=xchat-bttrw

build() {
 cd $startdir/src
 rm -rf xchat-bttrw/

 svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
 cd $_svnmod
 
 msg "SVN checkout done or server timeout"
 msg "Starting make..."

 make || return 1

 mkdir -p $startdir/pkg/usr/bin
 cp gate $startdir/pkg/usr/bin/xchat-bttrw
 
 msg "Copying init script and configuration file..."
 mkdir -p $startdir/pkg/etc/rc.d/
 cp $startdir/src/init-script $startdir/pkg/etc/rc.d/xchat-bttrw
 chmod 755 $startdir/pkg/etc/rc.d/xchat-bttrw
 mkdir -p $startdir/pkg/etc/conf.d/
 cp $startdir/src/xchat-bttrw.conf $startdir/pkg/etc/conf.d/xchat-bttrw
 chmod 644  $startdir/pkg/etc/conf.d/xchat-bttrw
 
 rm -rf $startdir/src/$_svnmod
}

