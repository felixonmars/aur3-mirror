# Contributor: pressh <pressh at gmail dot com>
# Contributor: mpie <michael.kyne-phillips1@ntlworld.com> 
 pkgname=kmp
 pkgver=0.5
 pkgrel=3
 pkgdesc="QT frontend for mpd" 
 url="http://www.threadbox.net/2005/3/10/kmp" 
 license=('GPL2')
 depends=('qt3' 'mpd')
 source=(http://www.threadbox.net/code/files/kmp/$pkgname-$pkgver.tar.bz2 kmp.desktop) 
 arch=('i686' 'x86_64')
 options=(!libtool)
md5sums=('2adb9da4167eefca1808e159e7222301'
         'bb699e43411a276a1f6d35dc39186124')

 build() {
  cd $startdir/src/$pkgname 
  qmake kmp.pro
  make || return 1
  install -d -m755 $startdir/pkg/usr/bin $startdir/pkg/usr/share/icons
  install -m755 kmp $startdir/pkg/usr/bin
  install -Dm644 $startdir/src/kmp.desktop $startdir/pkg/usr/share/applications/kmp.desktop
  cp pics/*.png $startdir/pkg/usr/share/icons
 }
