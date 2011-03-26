# Contributor: Mathijs Kadijk <mkadijk@gmail.com>
pkgname=netswitch
pkgver=0.5
pkgrel=1
pkgdesc="A simple netcfg frontend"
url="http://mac-cain13.livejournal.com/tag/netswitch"
depends=('initscripts' 'kdesu' 'bash' 'zenity' 'libnotify' 'sudo' 'notification-daemon')
makedepends=('')
source=("http://mathijs.rnoud.net/stuff/$pkgname-$pkgver.tar.gz")
backup=('etc/netswitch.conf')
md5sums=('3161be15077ab3c29088ea0c4148c10d')

build() 
{ 
  install -D -m644 $startdir/src/$pkgname/$pkgname.desktop $startdir/pkg/usr/share/applications/$pkgname.desktop
  install -D -m644 $startdir/src/$pkgname/$pkgname.png $startdir/pkg/usr/share/pixmaps/$pkgname.png
  install -D -m755 $startdir/src/$pkgname/$pkgname  $startdir/pkg/usr/bin/$pkgname
  install -D -m644 $startdir/src/$pkgname/$pkgname.conf $startdir/pkg/etc/$pkgname.conf
  install -D -m644 $startdir/src/$pkgname/$pkgname.1 $startdir/pkg/usr/man/man1/$pkgname.1
}

