# Maintainer: Peter Bui <pnutzh4x0r@gmail.com>

pkgname=python-rest2web
pkgver=0.5.1
pkgrel=2
pkgdesc="A tool for autobuilding html pages for websites or project documentation."
arch=('i686' 'x86_64')
url="http://www.voidspace.org.uk/python/rest2web/index.html"
license=('BSD')
depends=('python2')
makedepends=('setuptools')

source=(http://www.voidspace.org.uk/cgi-bin/voidspace/downman.py?file=rest2web-$pkgver.tar.gz)
md5sums=('76979ddb6c390377f748c430d8ffc58b')

build() {
    cd "$srcdir/rest2web-$pkgver"

    python2 -c "import compileall; compileall.compile_dir('$srcdir/rest2web-$pkgver', force=True)"

    install -Dm755 $srcdir/rest2web-$pkgver/r2w.py $pkgdir/usr/bin/r2w.py
    sed -i 's|/usr/bin/python$|/usr/bin/python2|' $pkgdir/usr/bin/r2w.py

    mkdir -p $pkgdir/usr/lib/python2.7/site-packages
    cp -r $srcdir/rest2web-$pkgver/rest2web $pkgdir/usr/lib/python2.7/site-packages
}
