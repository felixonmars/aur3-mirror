pkgname=prun
pkgver=1.0.6
pkgrel=0
pkgdesc="Let run shell jobs in parallel on defined number of threads"
arch=(i686 x86_64)
url="https://github.com/Try2Code/jobQueue"
license=('BSD')
groups=(system)
depends=(ruby)
makedepends=(rubygems)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://rubygems.org/downloads/jobQueue-$pkgver.gem)
noextract=(jobQueue-$pkgver.gem)
md5sums=('922b30d8bf7716aeac0861acdf39b11b')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "jobQueue-$pkgver.gem"
}
