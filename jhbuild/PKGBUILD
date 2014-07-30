# Maintainer: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=jhbuild
pkgver=20140729
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
        'use_python2_when_building_some_modules.patch')
sha256sums=('SKIP'
            '213b21707e8d9b1e66511342bb46631629d5c9854caaae5c9e8b74d314515d88')
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
}
