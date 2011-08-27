# Maintainer: Yannick ML <yannicklm1337@gmail.com>
pkgname=ruby-wirble
pkgver=0.1.3
pkgrel=1
pkgdesc="Handful of common Irb features, made easy."
arch=(any)
url="http://pablotron.org/software/wirble/"
license=('MIT')
depends=(ruby)
makedepends=(rubygems)
install="ruby-wirble.install"
source=(http://pablotron.org/files/gems/wirble-$pkgver.gem
       'http://hg.pablotron.org/wirble/raw-file/68769b551123/COPYING')
md5sums=('47877f7e67c12b1782aca39f997078fb'
         'a86700f23c301289f2e6a5a32cdb388a')
noextract=(wirble-$pkgver.gem)

build() {
  cd $srcdir
  # _gemdir is defined inside build() because if ruby[gems] is not installed on the system
  # makepkg will exit with an error when sourcing the PKGBUILD
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  install -Dm644 $srcdir/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" wirble-$pkgver.gem
}

# vim:set ts=2 sw=2 et:
