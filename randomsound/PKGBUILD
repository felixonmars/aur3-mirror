# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Previous Maintainer: pootzko <pootzko(at)gmail(dot)com>
# Maintainer: Anthony Vitacco <anthony@littlegno.me>

pkgname=randomsound
pkgver=0.2
pkgrel=2
pkgdesc="An ALSA sound card related entropy gathering daemon"
arch=('i686' 'x86_64')
url="http://www.digital-scurf.org/files/randomsound/"
license=('MIT')
depends=()
backup=("etc/conf.d/$pkgname")
source=(http://www.digital-scurf.org/files/$pkgname/$pkgname-$pkgver.tar.gz
        $pkgname.{service,conf})
md5sums=('76766477db530269045939dd9988c535'
         'c167b9426fbcb656ee7329b9e7abe378'
         'fe41d79afdf6a5764d626c6fcf0cdc57')

build() {
  cd $srcdir/$pkgname-$pkgver
  make || return 1
  install -D -m755 $pkgname $pkgdir/usr/sbin/$pkgname
  install -D -m644 $pkgname.8 $pkgdir/usr/share/man/man8/$pkgname.8
  install -D -m644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
  install -D -m755 $srcdir/$pkgname.service $pkgdir/etc/systemd/system/$pkgname.service
  install -D -m644 $srcdir/$pkgname.conf $pkgdir/etc/conf.d/$pkgname
}

