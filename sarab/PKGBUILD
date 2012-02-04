# Contributor: bender02 at gmx dot com
pkgname=sarab
pkgver=1.0.0
pkgrel=1
pkgdesc="Schedule And Rotate Automatic Backups"
url="http://sarab.sourceforge.net/"
license=("GPL2")
depends=('dar')
arch=('any')
backup=('etc/sarab/sarab.conf' 'etc/sarab/sarab.dcf' 'etc/sarab/rotation.schedule')
source=(http://downloads.sf.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('c039dfeea33640a201b4187346ee0127')

build() {
  cd $srcdir/$pkgname-$pkgver
  # fix CRLF
  sed -i 's/$//' etc/rotation.schedule etc/rotation.schedule.README \
                 etc/sarab.conf etc/sarab.dcf
  sed -i 's/$//' etc/examples/*
  sed -i 's/$//' sarab.sh CHANGELOG FAQ INSTALL README
  # fix paths
  sed -i 's|/usr/local/bin|/usr/bin|' etc/sarab.conf
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -d $pkgdir/etc/sarab/examples
  install -m 644 etc/rotation.schedule etc/rotation.schedule.README \
                 etc/sarab.conf etc/sarab.dcf $pkgdir/etc/sarab
  install -m 644 etc/examples/* $pkgdir/etc/sarab/examples
  install -d $pkgdir/usr/bin $pkgdir/usr/share/sarab
  install -m 755 sarab.sh $pkgdir/usr/bin
  install -m 644 CHANGELOG FAQ INSTALL README $pkgdir/usr/share/sarab
}
