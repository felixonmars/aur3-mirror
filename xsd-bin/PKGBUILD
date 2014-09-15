# Maintainer: kevku <kevku@gmx.com>
# Contributor: Rene Pärts <rene87@hot.ee>
pkgname=xsd-bin
_pkgname=xsd
pkgver=4.0.0
pkgrel=1
pkgdesc="W3C XML Schema to C++ translator library"
arch=('i686' 'x86_64')
[ "$CARCH" = "i686" ] && _arch='i686'
[ "$CARCH" = "x86_64" ] && _arch='x86_64'
url="http://www.codesynthesis.com/projects/xsd/"
license=('GPL')
depends=('glibc')
provides=('xsd')
conflicts=('xsd')
source=(http://www.codesynthesis.com/download/xsd/4.0/linux-gnu/$_arch/$_pkgname-$pkgver-$_arch-linux-gnu.tar.bz2)
[ "$CARCH" = "i686" ] && sha1sums=('6d244d447cc995cc7df77dcf0f015d60002782a0')
[ "$CARCH" = "x86_64" ] && sha1sums=('5eeb2eeca0d893949e3677bb374e7b96f19770d6')

package() {
    cd $srcdir/$_pkgname-$pkgver-$_arch-linux-gnu/
    
    # make folders
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
  
    install -Dm0755 bin/xsd ${pkgdir}/usr/bin/xsdcxx
    install -Dm0644 doc/xsd.1 $pkgdir/usr/share/man/man1/xsdcxx.1
}
