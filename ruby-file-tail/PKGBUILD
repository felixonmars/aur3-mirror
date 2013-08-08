# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
_gemname=file-tail
pkgname=ruby-$_gemname
pkgver=1.0.12
pkgrel=1
pkgdesc="Library to tail files in Ruby."
arch=(any)
url="http://flori.github.com/file-tail"
license=(GPL)
depends=('ruby' 'ruby-tins')
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('3875bf548788c00627b12cd486b206df')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
