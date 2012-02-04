# Maintainer: doorknob60 <doorknob60 at gmail dot com>

pkgname=shutdown-dialog
pkgver=2
pkgrel=1
pkgdesc="A dummy package, please install pygtk-shutdown-git instead. This will only provide a symlink from pygtk-shutdown to shutdown-dialog.py"
arch=('any')
# URL to page of original project
# url="http://www.penguindevelopment.org/index.php?title=Release:shutdown-dialog"
url="https://github.com/doorknob60/pygtk-shutdown"
license=('GPL')
depends=('pygtk-shutdown-git')

build() {
install -d "$pkgdir/usr/bin"
ln -sf /usr/bin/pygtk-shutdown "$pkgdir/usr/bin/shutdown-dialog.py"
}
