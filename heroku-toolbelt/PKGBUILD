# Maintainer: pisuka <tekmon@gmail.com>
pkgname=heroku-toolbelt
pkgver=2.39.1
pkgrel=1
pkgdesc="Everything you need to get started using Heroku"
arch=(any)
url="https://toolbelt.heroku.com"
license=(MIT APACHE RUBY PerlArtistic GPL custom)
groups=()
depends=("ruby>=1.9")
makedepends=("ruby-bundler")
optdepends=(git)
provides=()
conflicts=(ruby-heroku ruby-foreman heroku-client)
replaces=()
backup=()
options=()
install=
source=(http://assets.heroku.com/heroku-client/heroku-client-${pkgver}.tgz Gemfile Gemfile.lock)
md5sums=(262bd260c4c18c951da34f93d915ef8a 87c0b38b89cba72f964cff2a2df7c33e 8719f2ed74f0c2a34bb325161e5a5b50)

package() {
	cd "$pkgdir"
	mkdir -p "usr/lib/ruby/vendor_ruby/$pkgname" "usr/bin"
	cd "usr/lib/ruby/vendor_ruby/$pkgname"

	cp -R "$srcdir/heroku-client" .
	cp -L "$srcdir"/Gemfile* .

	find "heroku-client/bin" -maxdepth 1 -type f -executable -printf "/usr/lib/ruby/vendor_ruby/$pkgname/heroku-client/bin/%f\n" | xargs ln -st "$pkgdir/usr/bin/"

	msg "Installing foreman..."

	bundle install --standalone --deployment --binstubs="$pkgdir/usr/bin"

	rm "$pkgdir/usr/bin/thor"
}

# vim:set ts=2 sw=2 et:
