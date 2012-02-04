# Maintainer: TDY <tdy@gmx.com>

pkgname=snowbox
pkgver=1.0
pkgrel=1
pkgdesc="A simple, secure, and easy-to-setup POP3 server"
arch=('i686' 'x86_64')
url="http://kiza.kcore.de/software/snowbox/"
license=('GPL')
depends=('perl-digest-md5')
backup=(etc/{config,user.auth})
source=(http://kiza.kcore.de/media/software/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('f652ad01f270c06632411ed824467572')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/sbin/$pkgname"
  install -Dm644 $pkgname.8 "$pkgdir/usr/share/man/man8/$pkgname.8"
  install -Dm600 config "$pkgdir/etc/$pkgname/config"
  install -Dm600 user.auth.example "$pkgdir/etc/$pkgname/user.auth"
}
