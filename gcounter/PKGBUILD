#Contributor: MiddleofDreams <middleofdreams at gmail dot com>
pkgname=gcounter
pkgver=1.0rc3
pkgrel=2
pkgdesc="GCounter is a small utility that allows you suspend/shutdown/reboot your computer at specific time."
arch=('i686' 'x86_64')
url="http://middleofdreams.wordpress.com/gcounter"
license=('GPL')
depends=('python2' 'pygtk' 'gtk2')
makedepends=()
optdepends=('python-notify: for notifications support')
source=(http://cloud.github.com/downloads/middleofdreams/$pkgname/$pkgname-$pkgver.tar.bz2 $pkgname.bin $pkgname.desktop)
md5sums=('d855abbe8dc2ae4f9f5e4993300beb36'
         'f64292c0ddd732abadef119fece85169'
         '6e687ebbb144c67f323d9964b966519e')
         
build() {
	ls $srcdir/$pkgname
  install -d $pkgdir/usr/{bin/,share/applications,share/gcounter}

 	install -Dm755 $srcdir/$pkgname.bin $pkgdir/usr/bin/$pkgname
	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/
	cp -r $srcdir/$pkgname/ $pkgdir/usr/share/
   
}

