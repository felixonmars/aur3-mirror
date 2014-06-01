# Contributor: Nasser Alshammari <designernasser@gmail.com>
pkgname=dualtidy
pkgver=20140531
pkgrel=1
pkgdesc="Lightweight GTK tray battery monitor that support more than one battery. Python fork of tidybattery"
arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?pid=997284"
license=('GPL')
depends=(python2 gtk2 acpi)
makedepends=()
source=(https://raw.github.com/nashamri/dualtidy/master/"$pkgname".py)
md5sums=('c7be5ab6d3aa1f9c8d48122b3b6d5fd7')

package () {
   cd "$srcdir"
    install -D -m 0755 dualtidy.py "$pkgdir"/usr/bin/dualtidy
    }

