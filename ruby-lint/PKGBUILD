# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
pkgname=ruby-lint
pkgver=2.0.3
pkgrel=1
pkgdesc='A linter and static code analysis tool for Ruby.'
arch=(any)
url='https://github.com/yorickpeterse/ruby-lint/'
license=('MIT')
depends=(
	'ruby'
	'ruby-parser>=2.2'
	'ruby-slop>=3.4.7')
noextract=($pkgname-$pkgver.gem)
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
sha256sums=('d4d613d06a6f1a169aeaaaec315a8fb836609ede2f7b99a4f383ec7c248311b5')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" "$pkgname-$pkgver.gem"
}
