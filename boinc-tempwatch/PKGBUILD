# Maintainer: Till Hofmann < hofmann till at gmail dot com >
pkgname=boinc-tempwatch
pkgver=1.2
pkgrel=4
pkgdesc="simple script to allow watching temperatures with boinc"
url="http://halnt.de/till/boinc-tempwatch"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('lm_sensors')
source=("http://halnt.de/till/${pkgname}/${pkgname}-${pkgver}.tar.gz")
package() {
	cd $srcdir
	mkdir -p $pkgdir/etc
	install -Dm644 boinc-tempwatch.conf $pkgdir/etc
	mkdir -p $pkgdir/usr/lib/boinc-tempwatch
	install -Dm755 boinc-tempwatch $pkgdir/usr/lib/boinc-tempwatch/
	mkdir -p $pkgdir/etc/systemd/system
	install -Dm 644 boinc-tempwatch.service $pkgdir/etc/systemd/system/
	}

md5sums=('1f7bd597f0432cc800548d620c781ac9')
