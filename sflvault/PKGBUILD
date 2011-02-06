# $Id$
# Maintainer: superbaloo <superbaloo+archlinux@superbaloo.net>
# Contributor: Arthur Gautier <superbaloo+archlinux@superbaloo.net>
pkgname=sflvault
pkgver=0.7.3dev # note: if the pkgver had been '0.99-10' then use an underscore. like '0.99_10'
pkgrel=1
pkgdesc="SFLvault is a Networked credentials store and authentication manager"
arch=(i686 x86_64)
url="http://www.sflvault.org"
license=('GPL')
groups=
provides=
depends=('python-pysqlite' 'python-simplejson' 'pycrypto' 'python-pexpect' 'python-urwid' 'python-pylons' 'python-webhelpers' 'python-paste-script' 'ipython' 'python-sqlalchemy-0.4')
#makedepends=('guile')
makedepends=('git')
#conflicts=('yafoo')
#replaces=('mffoo')
#backup=('etc/foo/foo.conf')
#install=('foo.install')
#source=(http://www.foo.org/download/$pkgname-$pkgver.tar.gz)
source=()
md5sums=()
 
build() {
  git clone http://git.sflvault.org/sflvault.git $pkgname
  cd $startdir/src/$pkgname
  git fetch origin v$pkgver:v$pkver
  git checkout v$pkgver

  python setup.py install --prefix=/usr --root=$startdir/pkg/


}
