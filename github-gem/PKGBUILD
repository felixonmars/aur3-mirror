# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
pkgname=github-gem
pkgver=0.4.2
pkgrel=1
pkgdesc="Defunkt's Github ruby gem. The official 'github' command line helper"
arch=(any)
url="http://github.com/defunkt/github-gem"
license=('MIT')
depends=(ruby-json_pure 'ruby-highline>=1.5.1' 'ruby-text-format>=1.0.0')
makedepends=(rubygems)
source=(http://rubygems.org/downloads/github-$pkgver.gem
        http://github.com/defunkt/github-gem/raw/master/LICENSE)
md5sums=('1a1ed131c5ed49cc9dd2e0656d594f78'
         'ce063f8e66636d8d69e81d806487bd1e')
noextract=(defunkt-github-$pkgver.gem)

build() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies -i "$pkgdir$_gemdir" github-$pkgver.gem
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/bin"
  mv "$pkgdir$_gemdir/bin/gh" "$pkgdir$_gemdir/bin/github" "$pkgdir/usr/bin/"
  rmdir "$pkgdir$_gemdir/bin"
}

# vim:set ts=2 sw=2 et:
