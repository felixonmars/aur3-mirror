# Maintainer: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=jhbuild
pkgver=20131228
pkgrel=2
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
        'use_python2_when_building_some_modules.patch')
sha256sums=('SKIP'
            '9e0a0681cd5a7a67368dc19fe804033066c96a17612a69d06741db927340bce4')
url='https://live.gnome.org/Jhbuild/'

build() {
    cd "$pkgname"

    patch -p1 < ../use_python2_when_building_some_modules.patch

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
