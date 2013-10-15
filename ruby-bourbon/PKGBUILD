# Maintainer: milki <milki@rescomp.berkeley.edu>


_gemname=bourbon
pkgname=ruby-$_gemname
pkgver=3.1.8
pkgrel=1
pkgdesc="A simple and lightweight mixin library for Sass"
arch=('any')
url="https://github.com/thoughtbot/bourbon"
license=('MIT')
depends=('ruby' 'ruby-sass' 'ruby-thor')
makedepends=('rubygems')
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=("$_gemname-$pkgver.gem")
sha256sums=('23bf657586bf072f3dd9c479c2c4c862d25dda0c2a4ec31151f740d95b57b790')

package() {
    cd "$srcdir"
	local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
