# Contributor: Lex Rivera <x-demon@x-demon.org>
pkgname=vkfs
pkgver=24
pkgrel=1
pkgdesc="FUSE filesystem for vk.com"
arch=('i686' 'x86_64')
url="http://code.google.com/p/$pkgname/"
license=('GPL2')
depends=('fuse' 'curlpp')
conflicts=('vkfs-svn')
source=(http://$pkgname.googlecode.com/files/${pkgname}_src.tar)
md5sums=('83b2a661021cff67e68452dd2467ee24')

build() {
  cd $srcdir/$pkgname || return 1
  make || return 1
  install -Dm755 bin/vkfs ${pkgdir}/usr/bin/vkfs || return 1
}
# vim:syntax=sh
