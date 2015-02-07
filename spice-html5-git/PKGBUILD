# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>
pkgname=spice-html5-git
provides=spice-html5
pkgdesc="A html5 client for the spice protocol."
url="http://cgit.freedesktop.org/spice/spice-html5"
license=('GPL3')
arch=(any)
pkgver=1
pkgrel=1
depends=('bash')
makedepends=('git')

source=("git://anongit.freedesktop.org/spice/spice-html5")

md5sums=('SKIP')

build() {
    cd "$srcdir"
    mkdir -p "$srcdir/usr/share"
    mv "$srcdir/spice-html5" "$srcdir/usr/share/spice-html5"
}

package() {
  cd "$srcdir/"
  cp -R "$srcdir/usr" "$pkgdir/"
}

