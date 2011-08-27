# Contributor: Olivier Duclos <olivier.duclos gmail.com>

pkgname=xcompmgr-dana
pkgver=20091025
pkgrel=4
pkgdesc="Dana Jansens's fork of the X Composisting Manager"
arch=('i686' 'x86_64')
url="http://oliwer.net/xcompmgr-dana/"
license=('MIT')
depends=('libxcomposite' 'libxdamage' 'libxrender')
provides=(xcompmgr)
conflicts=(xcompmgr xcompmgr-git)
replaces=(xcompmgr xcompmgr-git)
source=(http://oliwer.net/xcompmgr-dana/xcompmgr-dana.tar.gz
        send-event.patch)
md5sums=('f4355e38eb0cf269cd3fbfd54c153e44'
         'f6c3293d75e6f91318d2ec4153194b0b')

build() {
  cd $srcdir/$pkgname
  patch -p1 < ../send-event.patch || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
