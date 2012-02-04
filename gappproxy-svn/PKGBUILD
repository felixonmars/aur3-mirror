# Contributor: muzuiget <muzuiget@gmail.com>

pkgname=gappproxy-svn
pkgver=102
pkgrel=1
pkgdesc="A http proxy based on Google App Engine"
license=('GPL')
url="http://code.google.com/p/gappproxy/"
depends=('python')
conflicts=('gappproxy')
provides=('gappproxy')
md5sums=()
source=()
arch=('i686' 'x86_64')

_svntrunk="http://gappproxy.googlecode.com/svn/trunk/"
_svnmod="gappproxy-read-only"

build() { 

cd $startdir/src

    msg "Updating SVN entries for $_svnmod..."
    svn checkout $_svntrunk $_svnmod
    svn export $_svnmod gappproxy-${pkgver}
    msg "SVN checkout done or server timeout"

    # install gappproxy
    mkdir -p $startdir/pkg/opt/gappproxy/
    mv $startdir/src/gappproxy-${pkgver}/* $startdir/pkg/opt/gappproxy/
    chown -R root:root $startdir/pkg/opt/gappproxy/ 
    # make shortcut
    mkdir -p $startdir/pkg/usr/bin/
    mkdir -p $startdir/pkg/usr/share/pixmaps/
    mkdir -p $startdir/pkg/usr/share/applications/
    ln -s /opt/gappproxy/localproxy/proxy.py $startdir/pkg/usr/bin/gappproxy
    cp $startdir/gappproxy.png $startdir/pkg/usr/share/pixmaps/
    cp $startdir/gappproxy.desktop $startdir/pkg/usr/share/applications/
}
