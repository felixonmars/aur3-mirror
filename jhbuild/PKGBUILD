# Maintainer: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=jhbuild
pkgver=3.5.91
pkgrel=4
pkgdesc='\
JHBuild allows you to automatically download and compile Gnome\
 "modules" (i.e. source code packages).'
arch=('i686' 'x86_64')
license=('GPL')
depends=(python2)
makedepends=(autoconf
             automake
             libtool
             gettext
             pkgconfig
             rsync
             subversion
             gnome-common
             git
             intltool
             gnome-doc-utils
             yelp-tools)
install=jhbuild.install
source=('http://download.gnome.org/sources/jhbuild/3.5/jhbuild-3.5.91.tar.xz'
        'use_python2_when_building_modules.patch')
sha256sums=('83807a08e38b7a1a2107eabd6c792808c9fbc1fdb7d9bfbc68482c4e0b24fa50'
            '30cad391349c73b6db5fb499c5acb8955f888d31fa83556f0d117f14001e10aa')
url='https://live.gnome.org/Jhbuild/'

build() {
    cd "$srcdir/$pkgname-$pkgver"
    
    patch -p1 < ../use_python2_when_building_modules.patch
    
    ./autogen.sh --prefix=/usr PYTHON=/usr/bin/python2
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -d "$pkgdir/usr/share/jhbuild"
    cp -dr modulesets "$pkgdir/usr/share/jhbuild"
    sed -ir '1 s/python/python2/' "$pkgdir/usr/bin/jhbuild"
    
    # prevent JHBuild from complaining that python.pc is not found
    install -d "$pkgdir/usr/lib/pkgconfig"
    ln -sr "$pkgdir/usr/lib/pkgconfig/python-2.7.pc" "$pkgdir/usr/lib/pkgconfig/python.pc"
}
