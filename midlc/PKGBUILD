 
# Contributor: zarra <zarraxx@gmail.com>

pkgname=midlc
pkgver=0.6.1
pkgrel=1
pkgdesc="A MIDL Compatible IDL compiler in C"
url="http://jcifs.samba.org/src/"
depends=()
license="GPL"
arch=('i686' 'x86_64')
source=(http://jcifs.samba.org/src/$pkgname-$pkgver.tar.gz
 $pkgname-$pkgver.patch
)
md5sums=('0fcad1f3122ed3a9263dd6ab0253214d' 'afb2fe7f219aad2fa34329b7fd9241b8')


build() {

  cd $srcdir
  patch -p0 < $srcdir/$pkgname-$pkgver.patch || return 1

  cd $pkgname-$pkgver
  cd libmba-0.9.1
  make ar || return 1
  cd ..
  make || return 1
  

  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/$pkgname
  install -m 755 midlc $pkgdir/usr/bin
  install -m 644 symtabc.txt $pkgdir/usr/share/$pkgname
  install -m 644 symtabjcifs.txt $pkgdir/usr/share/$pkgname
  install -m 644 symtabjava.txt $pkgdir/usr/share/$pkgname
  install -m 644 symtabsamba.txt $pkgdir/usr/share/$pkgname


}

