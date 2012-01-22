#Maintainer: Mamut Ghiunhan <venerix at gmail dot com>
pkgname='ntm'
pkgver='1.3'
pkgrel='1'
pkgdesc="Monitor of the network and internet traffic"
arch=('i686' 'x86_64')
license=('GPL')
depends=('pywebkitgtk' 'python-notify' 'lsb-release' 'networkmanager' 'dbus-python')
url=('http://netramon.sourceforge.net/eng/index.html')
source=("http://sourceforge.net/projects/netramon/files/NTM/ntm-1.x/$pkgname-$pkgver.tar.gz" "ntm.sh")

build() {
  cd "$srcdir/src"
	install -dm755 "$pkgdir/usr/share/ntm"
	cp -r * "$pkgdir/usr/share/ntm"

	find $srcdir -name ntm.mo -exec chmod 644 {} \;

	cp -r "$srcdir/i18n/locale" "$pkgdir/usr/share"
	install -Dm755 "$srcdir/ntm.sh" "$pkgdir/usr/bin/ntm"
}
md5sums=('1a5ceabf21c3fe39945a6fc0c93851c8'
         '54f50a5cac85426330a19086a107f1d4')
