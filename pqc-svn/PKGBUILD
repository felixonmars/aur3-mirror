# Maintainer:  MiakoMiyamura <miyamiyamura at gmail dot com>

pkgname=pqc-svn
pkgrel=1
pkgver=2
pkgdesc='PostgreSQL Query Cache enables to improve query processing performance extremely faster by caching query results from backends.'
arch=('i686' 'x86_64')
url='http://code.google.com/p/pqc/'
license=('BSD')
depends=('libmemcached' 'memcached')
makedepends=('automake-1.9' 'subversion')
install="${pkgname}.install"
source=('LICENSE')
md5sums=('b9120b098d96d502aee35460fce3c220')

_builddir="${srcdir}"/builddir
_svntrunk='http://pqc.googlecode.com/svn/trunk/src'
_svnmod="${srcdir}/pqc"

build() {
    cd "${srcdir}"
    
    msg 'Checking out sources...'    
    if [ -d .svn ]; then
        svn up
    else
        svn co "${_svntrunk}" --config-dir ./ "${_svnmod}"
    fi
    
    if test $? -ne 0; then
        msg 'Failed to download source code'
        return 1
    fi    

    msg 'Starting build...'
    
    rm -rf "${_builddir}"
    cp -r "${_svnmod}" "${_builddir}"
    cd "${_builddir}"
    
    automake-1.9 || /opt/automake-1.9/bin/automake-1.9 || return 1
    ./configure --prefix=/usr || return 1
    make || return 1
}

package() {
    cd ${_builddir}
    make DESTDIR="${pkgdir}" install || return 1

    install -D -m644 \
        "${srcdir}"/LICENSE \
        "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
