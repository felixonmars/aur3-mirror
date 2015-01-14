# Maintainer: Amir Mohammadi <183.amir@gmail.com>
pkgname=persian-calendar
pkgver=3.2.3
pkgrel=2
pkgdesc="A Persian (Jalali/Farsi) calendar appindicator"
arch=('any')
url="http://183amir.github.io/persian-calendar/"
license=('GPLv2')
depends=('python' 'python-khayyam' 'libappindicator-gtk3')
#source=($pkgname-$pkgver.tar.gz::https://github.com/183amir/$pkgname/archive/v$pkgver.tar.gz)
source=(deprecated)
md5sums=('SKIP')

package() {
	mkdir -p "$pkgdir/opt/persian-calendar"
	chmod 775 "$pkgdir/opt/persian-calendar"
	cp -r $srcdir/$pkgname-$pkgver/* "$pkgdir/opt/persian-calendar"

	install -Dm644 "$srcdir/$pkgname-$pkgver"/data/persian-calendar.desktop "$pkgdir"/usr/share/applications/persian-calendar.desktop
	install -Dm644 "$srcdir/$pkgname-$pkgver"/data/icons/days/persian-calendar-dark-theme-8.png "$pkgdir"/usr/share/pixmaps/persian-calendar.png
	install -Dm644 "$srcdir/$pkgname-$pkgver"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
	install -Dm644 "$srcdir/$pkgname-$pkgver"/data/icons/days/* "$pkgdir"/usr/share/pixmaps/

	# remove unnecessary files
	rm -r "$pkgdir"/opt/persian-calendar/data/icons/days
	rm "$pkgdir"/opt/persian-calendar/data/icon_generator.py
	rm "$pkgdir"/opt/persian-calendar/data/persian-calendar.desktop
	rm "$pkgdir"/opt/persian-calendar/data/Screenshot.png
}
