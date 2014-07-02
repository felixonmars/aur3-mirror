pkgname=svn2git
pkgver=2.3.1
pkgrel=1
pkgdesc="A fast-import based converter for an svn repo to git repos."
arch=('i686' 'x86_64')
url="http://gitorious.org/svn2git"
license=('MIT')
depends=('ruby' 'git' 'subversion' 'ruby-open4')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
md5sums=('2ea9575fdc0a86c67f09b9430632ae69')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}
