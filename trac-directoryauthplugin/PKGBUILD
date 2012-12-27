# Maintainer: Andre "Osku" Schmidt <andre.osku.schmidt@gmail.com>

_pkgname=directoryauthplugin
pkgname=trac-$_pkgname
pkgver=0.5
pkgrel=1
pkgdesc="LDAP, AD, etc. authentication plugin for Trac"
arch=('any')
url="http://trac-hacks.org/wiki/DirectoryAuthPlugin"
license=('BSD')
depends=('trac' 'python2' 'trac-accountmanagerplugin' 'python2-ldap' 'openssl')
makedpends=('python2-distribute')
source=($pkgname-$pkgver.zip::'http://trac-hacks.org/changeset/latest/directoryauthplugin?old_path=/&filename=directoryauthplugin&format=zip')
md5sums=('0c91e5f93a98faafdc182fa0a706a9b0')

build() {
  #TODO: change when upstream tags 0.5
  cd "$srcdir/$_pkgname/trunk"
  python2 setup.py build
}

package() {
  #TODO: change when upstream tags 0.5
  cd "$srcdir/$_pkgname/trunk"
  python2 setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
