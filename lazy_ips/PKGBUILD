# Maintainer: Boris Timofeev <mashin87@gmail.com>

pkgname=lazy_ips
pkgver=20120219
pkgrel=1
pkgdesc="an IPS patcher written in Python and GTK"
arch=('any')
url="http://www.emunix.org/2012/02/lazyips-patcher.html"
license=('GPL3')
depends=('python2' 'pygtk')
source=("http://dl.dropbox.com/u/62948567/lazy_ips.py"
        "$pkgname.desktop")
md5sums=('90f595ac0f8ba328f0614719905350d5'
         '67f67dc9c2c8e47c1f15c55de90374ec')

build() {

  cd "$srcdir"

  mkdir -p "$pkgdir"/usr/{bin,share/applications}
  install -Dm755 "$pkgname.py" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications"
}