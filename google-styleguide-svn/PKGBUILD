# Maintainer: Tianjiao Yin <ytj000@gmail.com>
pkgname=google-styleguide-svn
_svntrunk=http://google-styleguide.googlecode.com/svn/trunk/
_svnmod=google-styleguide
pkgver=79 
pkgrel=1
pkgdesc="Style guides for Google-originated open-source projects"
url="http://code.google.com/p/google-styleguide/"
arch=(any)
license=('cc-by-3.0')
optdepends=("python2: for cpplint")
build() {
    cd ${srcdir}
    rm -rf en
    svn co ${_svntrunk} en -r ${pkgver}
    cd en/cpplint
    sed -i "s|/usr/bin/python2.4|/usr/bin/env python2|" cpplint.py
    install -Dm755 cpplint.py ${pkgdir}/usr/bin/cpplint.py
    cd ..
    rm cpplint -rf
    cd ..
    mkdir -p ${pkgdir}/usr/share/doc/google-styleguide/
    mv en ${pkgdir}/usr/share/doc/google-styleguide/
    rm -rf ${pkgdir}/usr/share/doc/google-styleguide/en/.svn
}

