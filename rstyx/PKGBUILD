# Maintainer: Jens Staal <staal1978@gmail.com> 
pkgname=rstyx
pkgver=0.4.2
pkgrel=1
pkgdesc="A pure ruby implementation of the 9P2000/styx file system/protocol"
arch=('i686' 'x86_64')
url="http://rubyforge.org/projects/rstyx/"
license=('Ruby license')
depends=('ruby')
makedepends=(rubygems)
source=(http://rubyforge.org/frs/download.php/25743/rstyx-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
md5sums=('f3ad5cc91b1ca10fe554711a99a5c283')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$pkgname-$pkgver.gem"
} 
