pkgname=vranger-git
pkgrel=1
pkgver=0.0
pkgdesc="vim/ranger integration scripts"
arch=('i686' 'x86_64')
url="http://github.com/mikezackles/vranger"
depends=('tmux' 'ranger' 'vim')
provides=('vranger')
conflicts=('vranger')
license=('GPL')
source=(git+https://github.com/mikezackles/vranger.git)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/vranger"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  install -Dm755 "$srcdir/vranger/vranger" "$pkgdir/usr/bin/vranger"
  install -Dm755 "$srcdir/vranger/vrim" "$pkgdir/usr/bin/vrim"
}
