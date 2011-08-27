# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=usp2
pkgver=484
pkgrel=3
pkgdesc="Simple menu and launcher for GNOME" 
url="http://code.google.com/p/ubuntu-system-panel" 
license=('GPL') 
depends=('gnome-panel' 'python2' 'gnome-screensaver' 'deskbar-applet' 'gnome-python-desktop' 'gnome-session') 
makedepends=('subversion') 
options=('!libtool') 
arch=('i686' 'x86_64') 
source=()
md5sums=()

_svntrunk=http://ubuntu-system-panel.googlecode.com/svn/trunk/
_svnmod=ubuntu-system-panel

build() {
install -d ${pkgdir}/usr/{lib,share}

cd $startdir/src/
msg "Updating SVN entries for $_svnmod ..."
touch ~/.subversion
svn co $_svntrunk $_svnmod
msg "Finished update, starting build ..."

cp -r $_svnmod/$_svnmod $_svnmod-build
cd $_svnmod-build/usr/bin

# let's make it work on ArchLinux
sed -i 's/python2.4/python2.7/' usp
sed -i 's/distributor-logo/arch-logo/' usp
sed -i 's/System/ArchMenu/' usp
sed -i 's/python2.4/python2.7/' uspconfig
# python2 fix
sed -i 's/env python/env python2/' usp
sed -i 's/env python/env python2/' uspconfig

cd ${srcdir}/$_svnmod-build

# copy over some things to ${pkgdir} 
cp -rf usr/share/usp ${pkgdir}/usr/share
cp -rf usr/lib/bonobo ${pkgdir}/usr/lib
cp -rf usr/lib/python2.4 ${pkgdir}/usr/lib/python2.7
cp -rf usr/bin ${pkgdir}/usr

# we did copy over some stuff we don't need so remove it
rm -rf ${pkgdir}/usr/share/usp/.svn
rm -rf ${pkgdir}/usr/bin/.svn
rm -rf ${pkgdir}/usr/lib/bonobo/.svn
rm -rf ${pkgdir}/usr/lib/bonobo/servers/.svn
rm -rf ${pkgdir}/usr/lib/python2.7/.svn
rm -rf ${pkgdir}/usr/lib/python2.7/site-packages/.svn
rm -rf ${pkgdir}/usr/lib/python2.7/site-packages/usp/.svn
rm -rf ${pkgdir}/usr/lib/python2.7/site-packages/usp/plugins/.svn

# this will give some error messages for files already removed, so add 'return 0'
cd ${pkgdir}
find -name *.svn -exec rm -rf {} \; || return 0
} 
