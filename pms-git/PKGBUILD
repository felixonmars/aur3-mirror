# Maintainer: cirrus
# Contributor: Johannes Löthberg <johannes@kyriasis.com>

pkgname=pms-git
pkgver=0.r233.6747bd1
pkgrel=1
pkgdesc="Poor Man's Spotify"
arch=('i686' 'x86_64')
url='https://github.com/np1/pms'
license=('GPL3')
depends=('mplayer' 'python')
source=("$pkgname"::'git+https://github.com/np1/pms.git')
md5sums=('SKIP')

pkgver() {
     cd "$pkgname"
     printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
     cd "$pkgname"
     install -D -m755 pms "$pkgdir/usr/bin/pms"
     install -D -m644 README.rst "$pkgdir/usr/share/doc/$pkgname/README"
}
