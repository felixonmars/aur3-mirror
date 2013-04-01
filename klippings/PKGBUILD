# Maintainer: Mariusz Szczepańczyk <mszczepanczyk@gmail.com>

pkgname=klippings
pkgver=0.1.5
pkgrel=1
pkgdesc="A viewer of Kindle highlights, notes, and bookmarks, stored in 'My Clippings.txt' file."
arch=('any')
url="https://sites.google.com/site/kindlethearr/klippings"
license=('Public domain')
depends=('python2' 'python2-simplejson' 'python2-pyqt')
md5sums=('efdc2ab292884cf3718b44ea60888fb8' '893ab1f9ebe590c99e4199fd8589d938')
source=('https://www.dropbox.com/s/4wnkfkf0p7kntqf/klippings-src.zip' klippings.sh)

build() {
  cd "$srcdir/klippings"

  python2 -m compileall .
}

package() {
    mkdir -p "$pkgdir/usr/share/$pkgname"

    cp -r $srcdir/klippings/src/* $pkgdir/usr/share/$pkgname/
    install -Dm755 klippings.sh $pkgdir/usr/bin/klippings
}
