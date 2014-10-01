# Maintainer: kevku <kevku@gmx.com>
# Contributor: Rene Pärts <rene87@hot.ee>
pkgname=xsd3-bin
_pkgname=xsd
pkgver=3.3.0
pkgrel=1
pkgdesc="W3C XML Schema to C++ translator library version 3.3.0"
arch=('i686' 'x86_64')
[ "$CARCH" = "i686" ] && _arch='i686'
[ "$CARCH" = "x86_64" ] && _arch='x86_64'
url="http://www.codesynthesis.com/projects/xsd/"
license=('GPL')
depends=('glibc')
provides=('xsd=3.3.0')
conflicts=('xsd' 'xsd-bin')
source=(http://www.codesynthesis.com/download/xsd/3.3/linux-gnu/$_arch/$_pkgname-$pkgver-$_arch-linux-gnu.tar.bz2 fix_headers.patch)
[ "$CARCH" = "i686" ] && md5sums=('b7172b512a66f966e0dff191c2223927' '359c4f5a67775cab8ccd7a8c8c7d6087')
[ "$CARCH" = "x86_64" ] && md5sums=('62cf1291e210eba37738d5a02f7d2990' '359c4f5a67775cab8ccd7a8c8c7d6087')

prepare(){
    cd $srcdir/$_pkgname-$pkgver-$_arch-linux-gnu/libxsd
    patch -Np0 -i $srcdir/fix_headers.patch
    }
package() {
    cd $srcdir/$_pkgname-$pkgver-$_arch-linux-gnu/
    
    # make folders
    install -dm0755 libxsd/xsd/cxx ${pkgdir}/usr/include/xsd/cxx/compilers/vc-7
    install -dm0755 libxsd/xsd/cxx ${pkgdir}/usr/include/xsd/cxx/compilers/vc-8
    install -dm0755 libxsd/xsd/cxx ${pkgdir}/usr/include/xsd/cxx/parser/expat
    install -dm0755 libxsd/xsd/cxx ${pkgdir}/usr/include/xsd/cxx/parser/non-validating
    install -dm0755 libxsd/xsd/cxx ${pkgdir}/usr/include/xsd/cxx/parser/validating
    install -dm0755 libxsd/xsd/cxx ${pkgdir}/usr/include/xsd/cxx/parser/xerces
    install -dm0755 libxsd/xsd/cxx ${pkgdir}/usr/include/xsd/cxx/tree/bits
    install -dm0755 libxsd/xsd/cxx ${pkgdir}/usr/include/xsd/cxx/tree/parsing
    install -dm0755 libxsd/xsd/cxx ${pkgdir}/usr/include/xsd/cxx/tree/serialization
    install -dm0755 libxsd/xsd/cxx ${pkgdir}/usr/include/xsd/cxx/xml/bits
    install -dm0755 libxsd/xsd/cxx ${pkgdir}/usr/include/xsd/cxx/xml/dom/bits
    install -dm0755 libxsd/xsd/cxx ${pkgdir}/usr/include/xsd/cxx/xml/sax/bits

    # install files
    install -m0644 libxsd/xsd/cxx/{*.hxx,*.txx} ${pkgdir}/usr/include/xsd/cxx/
    install -m0644 libxsd/xsd/cxx/compilers/vc-7/* ${pkgdir}/usr/include/xsd/cxx/compilers/vc-7
    install -m0644 libxsd/xsd/cxx/compilers/vc-8/* ${pkgdir}/usr/include/xsd/cxx/compilers/vc-8
    install -m0644 libxsd/xsd/cxx/parser/{*.hxx,*.txx,*.ixx} ${pkgdir}/usr/include/xsd/cxx/parser
    install -m0644 libxsd/xsd/cxx/parser/expat/* ${pkgdir}/usr/include/xsd/cxx/parser/expat
    install -m0644 libxsd/xsd/cxx/parser/non-validating/* ${pkgdir}/usr/include/xsd/cxx/parser/non-validating
    install -m0644 libxsd/xsd/cxx/parser/validating/* ${pkgdir}/usr/include/xsd/cxx/parser/validating
    install -m0644 libxsd/xsd/cxx/parser/xerces/* ${pkgdir}/usr/include/xsd/cxx/parser/xerces
    install -m0644 libxsd/xsd/cxx/tree/{*.hxx,*.txx,*.ixx} ${pkgdir}/usr/include/xsd/cxx/tree
    install -m0644 libxsd/xsd/cxx/tree/bits/* ${pkgdir}/usr/include/xsd/cxx/tree/bits
    install -m0644 libxsd/xsd/cxx/tree/parsing/* ${pkgdir}/usr/include/xsd/cxx/tree/parsing
    install -m0644 libxsd/xsd/cxx/tree/serialization/* ${pkgdir}/usr/include/xsd/cxx/tree/serialization
    install -m0644 libxsd/xsd/cxx/xml/{*.hxx,*.txx,*.ixx} ${pkgdir}/usr/include/xsd/cxx/xml
    install -m0644 libxsd/xsd/cxx/xml/bits/* ${pkgdir}/usr/include/xsd/cxx/xml/bits
    install -m0644 libxsd/xsd/cxx/xml/dom/{*.hxx,*.txx} ${pkgdir}/usr/include/xsd/cxx/xml/dom
    install -m0644 libxsd/xsd/cxx/xml/dom/bits/* ${pkgdir}/usr/include/xsd/cxx/xml/dom/bits
    install -m0644 libxsd/xsd/cxx/xml/sax/*.hxx ${pkgdir}/usr/include/xsd/cxx/xml/sax
    install -m0644 libxsd/xsd/cxx/xml/sax/bits/* ${pkgdir}/usr/include/xsd/cxx/xml/sax/bits

    install -Dm4755 bin/xsd ${pkgdir}/usr/bin/xsdcxx
    install -Dm0644 documentation/xsd.1 $pkgdir/usr/share/man/man1/xsdcxx.1
}
