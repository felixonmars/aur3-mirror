# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=bogosort
pkgver=0.4.2
pkgrel=1
pkgdesc='bogosort sorts files or its standard input using the bogo-sort algorithm'
arch=('i686' 'x86_64')
url='http://www.lysator.liu.se/~qha/bogosort/'
license=('GPL')
source=('bogo.patch'
        'http://www.lysator.liu.se/~qha/bogosort/bogosort.tar.gz')
sha512sums=('fc109b6ad62a21f87829373fd70fd11e9eaa9b834b6edcfd1560cd6904f915ca9418e46e22540e5611a664ed3af9058bb6566ce3e0ec238ffc8c22556302565b'
        '2d2f7be36ec08aa78323cbdc5f1030297706c364d6fc82554065cf737295d11c90dd6061323f2732b63c70401d710b2018075bff6d1e6ab0078069b405ea62e9')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}/
    patch -p1 < ${srcdir}/bogo.patch
    ./configure
    make
}
package(){
    cd ${srcdir}/${pkgname}-${pkgver}/
    make DESTDIR=${pkgdir} install
}

# vim:set ts=4 sw=4 et:
