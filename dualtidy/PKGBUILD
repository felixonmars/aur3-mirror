# Contributor: Nasser Alshammari <designernasser@gmail.com>
pkgname=dualtidy
pkgver=20140504
pkgrel=1
pkgdesc="Lightweight GTK tray battery monitor for Lenovo Thinkpad x240 with the dual battery setup. Python fork of tidybattery"
arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?pid=997284"
license=('GPL')
depends=(python2 gtk2 acpi)
makedepends=()
source=(https://raw.github.com/nashamri/dualtidy/master/"$pkgname".py)
md5sums=('59f014c1decce5857bb0a1f39d38dab0')

package () {
   cd "$srcdir"
    install -D -m 0755 dualtidy.py "$pkgdir"/usr/bin/dualtidy
    }

