# Maintainer: DavidK <david_king at softhome dot net>
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: revel <revelΘmuub·net>
# Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>

pkgname=cl-asdf
_realname=asdf
pkgver=3.1.3
pkgrel=1
pkgdesc="Common Lisp's Another System Definition Facility (pre-installed in some implementations)"
arch=('any')
url="http://common-lisp.net/project/asdf"
license=('MIT')
depends=('common-lisp') # requires common-lisp for it to be at all useful, but doesn't need it to build.
makedepends=('texinfo')
provides=('asdf=3.1.3')
install=asdf.install
source=("http://common-lisp.net/project/$_realname/archives/$_realname-${pkgver}.tar.gz")
md5sums=('538e0eaae9bae9ea9231bda259272202')

build() {

    # build asdf.lisp
    cd "$srcdir"/$_realname-$pkgver
    rm -fr build

    make

    cd doc

    make asdf.info
    mv asdf.info asdf-${pkgver}.info

    cd ..

    # extract the copyright portion of the debian/copyright file; save it to doc/copyright

    cd debian

    cat copyright | sed -e :a -e '$q;N;25,$D;ba' > ../doc/copyright

    cd ..

}

package() {
    # What a user needs is nothing other than asdf.lisp.
    # All of the rest of the files are really for developing and debugging ASDF,
    # which require write access to the source directory.
    install -d "${pkgdir}"/usr/share/common-lisp/source/${_realname}
    install -d "${pkgdir}"/usr/share/common-lisp/source/${_realname}/build
    install -d "${pkgdir}"/usr/share/common-lisp/source/${_realname}/uiop
    install -d "${pkgdir}"/usr/share/info
    install -d "${pkgdir}"/usr/share/licenses/${pkgname}

    cd "$srcdir"/$_realname-$pkgver
    
    cp build/asdf.lisp ./asdf.lisp
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_realname} *.lisp *.asd version.*
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_realname}/build build/asdf.lisp
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_realname}/uiop uiop/*.lisp uiop/*.asd uiop/version.*
    install -m 644 doc/${_realname}-${pkgver}.info "${pkgdir}"/usr/share/info/${_realname}-${pkgver}.info
    install -m 644 doc/copyright "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

    
