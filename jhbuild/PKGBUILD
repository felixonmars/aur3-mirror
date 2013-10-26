# Maintainer: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=jhbuild
pkgver=20131015
pkgrel=1
pkgdesc='JHBuild allows you to automatically download and compile Gnome "modules" (i.e. source code packages).'
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
source=('git://git.gnome.org/jhbuild'
        'use_python2_when_building_gobject_introspection.patch'
        'build_gnome_3_12.patch')
sha256sums=('SKIP'
            '17f640dc81446adf0535b688436e45019bb75a75c8f4613bb84d031d181c00b4'
            '0439c6dcf2e9dd61ad2e76652628b334e66056cfdf0111d1afe0c4d3d1fb2384')
url='https://live.gnome.org/Jhbuild/'

build() {
    cd "$pkgname"

    patch -p1 < ../use_python2_when_building_gobject_introspection.patch
    patch -p1 < ../build_gnome_3_12.patch

    ./autogen.sh --prefix=/usr PYTHON=/usr/bin/python2
    make
}

package() {
    cd "$pkgname"

    make DESTDIR="$pkgdir" install
    install -d "$pkgdir/usr/share/jhbuild"
    cp -dr modulesets "$pkgdir/usr/share/jhbuild"
    sed -ir '1 s/python/python2/' "$pkgdir/usr/bin/jhbuild"
}
