# Maintainer: corvolino <corvolino@archlinux.com.br>

pkgname=cpuspeed
pkgver=1.5
pkgrel=4
pkgdesc="CPU frequency scaling utility"
url="http://www.carlthompson.net/Software/CPUSpeed"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bash')
backup=('etc/default/cpufreq')
options=('docs')
source=("http://www.carlthompson.net/downloads/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('4ff58ec10678db80a08bd5ad3589e838')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  local source=$srcdir/$pkgname-$pkgver
 
  make || return 1
}

