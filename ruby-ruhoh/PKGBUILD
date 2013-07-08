# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>

_gemname=ruhoh
pkgname=ruby-$_gemname
pkgver=2.2
pkgrel=1
pkgdesc="Ruby based library to process your Ruhoh static blog."
arch=('any')
url="http://github.com/ruhoh/ruhoh.rb"
license=('MIT')
depends=('ruby' 'ruby-rack>=1.4' 'ruby-mustache>=0.99' 'ruby-directory_watcher>=1.4.0' 'ruby-redcarpet>=2.1' 'ruby-nokogiri>=1.5')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install \
              -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
              $_gemname-$pkgver.gem
}

md5sums=('41ecbb814d2e595224e3496e0cdcd7e5')
sha1sums=('fabadf51ea6d062afadff6a2affbecc80ca2b506')
