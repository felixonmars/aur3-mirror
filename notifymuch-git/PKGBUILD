# Maintainer: nightshade <nightshade@wemakethings.net>
pkgname=notifymuch-git
pkgver=0.1.r20150416
pkgrel=1
pkgdesc="Display desktop notifications for unread mail in notmuch database"
url="https://github.com/kspi/notifymuch/"
license=('GPL3')
depends=('python' 'notmuch' 'python-gobject' 'glib2' 'libnotify')
makedepends=('python-setuptools')
arch=('i686' 'x86_64')
source=("git://github.com/kspi/notifymuch.git")
md5sums=('SKIP')

pkgver () {
    cd "$srcdir/notifymuch"
    echo "$(python setup.py --version).r$(date +%Y%m%d)"
}

package () {
    cd "$srcdir/notifymuch"
    python setup.py install --root="$pkgdir/" --optimize=1
}
