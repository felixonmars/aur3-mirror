# Maintainer: ogasser <oliver.gasser@gmail.com>
# Contributor: Tim Olsen <tolsen@limespot.com>
pkgname=python2-urllib2-kerberos
pkgver=0.1.6
pkgrel=1
pkgdesc="Kerberos over HTTP Negotiate/SPNEGO support for urllib2"
arch=('any')
url="https://pypi.python.org/pypi/urllib2_kerberos/"
license=('Apache License Version 2.0')
depends=('python2' 'krb5' 'python2-kerberos')
makedepends=('python2-distribute')
_dlname="urllib2_kerberos-$pkgver"
source=("https://pypi.python.org/packages/source/u/urllib2_kerberos/$_dlname.tar.gz")
md5sums=("9a22d5d243103e17ca0ccf64b51f54ec")


build() {
    cd "$srcdir"
    
    tar xf "$_dlname.tar.gz"
   
    cd "$_dlname" 
    python2 setup.py build
}

package() {
    cd "$srcdir/$_dlname"
    python2 setup.py install --root="$pkgdir/" --optimize=1 || return 1
}
