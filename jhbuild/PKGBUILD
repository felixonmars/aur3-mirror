# Maintainer: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=jhbuild
pkgver=3.5.91
pkgrel=9
pkgdesc='\
JHBuild allows you to automatically download and compile Gnome\
 "modules" (i.e. source code packages).'
arch=('i686' 'x86_64')
license=('GPL')
depends=(python2)
makedepends=(rsync
             subversion
             gnome-common
             git
             intltool
             gnome-doc-utils
             yelp-tools)
install=jhbuild.install
source=('http://download.gnome.org/sources/jhbuild/3.5/jhbuild-3.5.91.tar.xz'
        'use_python2_when_building_gobject_introspection.patch'
        'build_gnome_3_10.patch')
sha256sums=('83807a08e38b7a1a2107eabd6c792808c9fbc1fdb7d9bfbc68482c4e0b24fa50'
            '17f640dc81446adf0535b688436e45019bb75a75c8f4613bb84d031d181c00b4'
            'b678f3b281c32affc675e9bce7ff54e37bf9dbed6512ce1a8bfdb64156f27eec')
url='https://live.gnome.org/Jhbuild/'

build() {
    cd "$srcdir/$pkgname-$pkgver"
    
    patch -p1 < ../use_python2_when_building_gobject_introspection.patch
    patch -p1 < ../build_gnome_3_10.patch
    
    ./autogen.sh --prefix=/usr PYTHON=/usr/bin/python2
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -d "$pkgdir/usr/share/jhbuild"
    cp -dr modulesets "$pkgdir/usr/share/jhbuild"
    sed -ir '1 s/python/python2/' "$pkgdir/usr/bin/jhbuild"
}
