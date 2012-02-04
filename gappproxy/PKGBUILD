# Contributor: muzuiget <muzuiget@gmail.com>

pkgname=gappproxy
pkgver=1.0.0beta
pkgrel=1
pkgdesc="A http proxy based on Google App Engine"
license=('GPL')
url="http://code.google.com/p/gappproxy/"
depends=('python')
md5sums=('1b9090c8f5a9d384035ecc713802e085')
source=(http://gappproxy.googlecode.com/files/gappproxy-${pkgver}.tar.gz)
arch=('i686' 'x86_64')

build() { 
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
