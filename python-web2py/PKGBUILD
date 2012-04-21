# Maintainer: Surlyjake <surlyjake@gmail.com>
# Contributor: Marcelo Alaniz
pkgname=python-web2py
pkgver=1.99.7
pkgrel=1
pkgdesc="Free open source full-stack framework for rapid development of fast, scalable, secure and
portable database-driven web-based applications. Written and programmable in Python. "
arch=('i686' 'x86_64')
url="http://www.web2py.com"
license=('LGPL3')
depends=('python2')
makedepends=('unzip')
optdepends=('tk: GUI interface support')
source=('http://www.web2py.com/examples/static/web2py_src.zip')
md5sums=('a478f3091620612ceb86e193502967fa')

build() {
#fix python to point to python2
sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" $srcdir/web2py/web2py.py
}
package() {
mkdir -p $startdir/pkg/opt
cp -Rf $srcdir/web2py $startdir/pkg/opt
# Doesn't work properly when runnig from the symlinked web2py.py in /usr/bin/
#mkdir -p $startdir/pkg/usr/bin
#cd $startdir/pkg/usr/bin
#ln -s ../../opt/web2py/web2py.py web2py
}
