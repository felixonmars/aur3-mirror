# Maintainer: Anthony Vlasov <Vlasov-Ant@archlinux.info>

pkgname=money_counter
pkgver=2
pkgrel=1
pkgdesc="Progs for counter wages."
arch=('any')
url='http://archlinux.org.ru/forum/users/Anton8830/'
license=('GPL')
source=('base.sh'
'calendar.sh'
'date.fn'
'date.var'
'doing.sh'
'menu.fn'
'menu.var'
'money.sh'
'plus.sh'
'start.fn'
'start.var'
'workday.sh')
sha1sums=('9743f03007062136522c935fd233ed53241646a2'
          'a9c407a51321a22744de97764577d7b8ddc41622'
          '987089ba656ccb27257b5f559c6da08eb59945eb'
          '475819979837cf4e2c917052a706baf19ebf4ffa'
          'f92e70840ffea8a58490b54f4bf3d1eef63fc58d'
          '21a7b7618fb6f951451436ad6025435fa3403dda'
          'e66ff845da79b939513ed9c9b7aaed098b2518d0'
          '4288d9c2d91518781568743b7cc29c697fc34f30'
          'b11623f620f994c8bcdf8165970c02bba746469e'
          'a61199d66fc34c68e70b82508a6fb8514dca2e4a'
          '5bedd1d3d4d2477a4de050a35a9d0b2d1332b909'
          'd9756e8eb2872461a2add0ee569f3a7de8637160')

build() {
	true
}

package() {
	cd $srcdir
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/etc/money_counter
  cp ./*.sh $pkgdir/usr/bin
  mv $pkgdir/usr/bin/base.sh $pkgdir/usr/bin/money_counter 
  cp ./*.var $pkgdir/etc/money_counter
  cp ./*fn $pkgdir/etc/money_counter
  chmod 755 $pkgdir/usr/bin/*
  chmod 644 $pkgdir/etc/money_counter
  chmod 644 $pkgdir/etc/money_counter/*
}
