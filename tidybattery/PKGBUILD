# Contributor: Roman Komkov <r.komkov@gmail.com>
pkgname=tidybattery
pkgver=20131216
pkgrel=1
pkgdesc="Lightweight GTK tray battery monitor. Python fork of slimebattery"
arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?pid=997284"
license=('GPL')
depends=(python2 gtk2 acpi)
makedepends=()
source=(https://raw.github.com/decayofmind/tidybattery/master/"$pkgname".py)
md5sums=('ed1f23a9a2d645b5b03c5775e493d0bc')

package () {
   cd "$srcdir"
    install -D -m 0755 tidybattery.py "$pkgdir"/usr/bin/tidybattery
    }

