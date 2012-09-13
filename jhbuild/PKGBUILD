# Maintainer: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=jhbuild
pkgver=3.5.91
pkgrel=2
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
source=("http://download.gnome.org/sources/jhbuild/3.5/jhbuild-3.5.91.tar.xz")
md5sums=('f3a2d72b70014f9567f4c8ea76f812bc')
url='https://live.gnome.org/Jhbuild/'

build() {
    cd "$srcdir/$pkgname-$pkgver"
    
    export PYTHON=/usr/bin/python2
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -d "$pkgdir/usr/share/jhbuild"
    cp -dr modulesets "$pkgdir/usr/share/jhbuild"
    sed -ir '1 s/python/python2/' "$pkgdir/usr/bin/jhbuild"
}
