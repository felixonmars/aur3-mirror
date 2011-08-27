# Contributor: musicmastamike <musicmastamike@gmail.com>

pkgname=gourmet-dev
pkgver=0.15.9
pkgrel=1
pkgdesc="A simple but powerful recipe-managing application (development version)"
arch=('i686' 'x86_64')
url="http://grecipe-manager.sourceforge.net/"
license="GPL"
depends=('python2' 'pygtk' 'python2-distribute' 'gnome-python-extras'
         'libglade' 'metakit' 'python-imaging' 'python-pysqlite'
         'python2-sqlalchemy')
makedepends=('intltool')
optdepends=('libgnomeprintui: gnome printing support'
            'pyrtf: RTF support'
            'python-reportlab: PDF export support')
conflicts=('gourmet' 'gourmet-devel')
replaces=('gourmet' 'gourmet-devel')
provides=('gourmet')
source=(http://downloads.sourceforge.net/sourceforge/grecipe-manager/gourmet-$pkgver.tar.gz)
md5sums=('7bef5569fb4523747973d83ab69a9a79')

build() {
    cd ${srcdir}/gourmet-${pkgver}

    # python2 fix
    for file in $(find . -name '*.py' -print); do
        sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' $file
        sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
    done

    python2 setup.py install --root=${pkgdir}
}
