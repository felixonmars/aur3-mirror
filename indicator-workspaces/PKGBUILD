# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Madek <gonzaloseguel@gmail.com>

pkgname=indicator-workspaces
pkgver=0.5
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Mail checker for indicator"
url="https://launchpad.net/indicator-workspaces"
license=('GPL')
depends=('indicator-messages' 'indicator-application' 'python2')
makedepends=('libtool' 'intltool')
replaces=()
conflicts=()
provides=()
source=(http://launchpadlibrarian.net/57852703/${pkgname}_$pkgver.tar.gz)
md5sums=('815b5688a258e2f208e1ac81174562db')

build() {

    cd $pkgname-$pkgver
    
    export PYTHON="/usr/bin/python2"
    sed -i 's|#![ ]*/usr/bin/python$|#!/usr/bin/python2|' indicator-workspaces
    sed -i "s|export DESTDIR=/usr|export DESTDIR=$pkgdir/usr|" install
    
    mkdir -p $pkgdir/usr/share/indicator-workspaces
    mkdir -p $pkgdir/usr/share/icons/ubuntu-mono-dark/status/24
    mkdir -p $pkgdir/usr/share/icons/ubuntu-mono-light/status/24
    mkdir -p $pkgdir/usr/bin
    
    make install
}
