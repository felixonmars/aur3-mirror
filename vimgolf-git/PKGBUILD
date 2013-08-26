# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
_gemname=vimgolf
pkgname=vimgolf-git
pkgver=0.4.5.0.gd3f3f56
pkgver(){
  cd $_gemname
  git describe --tags --long |sed 's/-/./g;s/^v//'
}
epoch=1
pkgrel=1
pkgdesc="Cli application to test your vim ninja skills"
arch=(any)
url="http://vimgolf.com/"
license=('GPL')
depends=(ruby-diff-lcs ruby ruby-highline ruby-thor ruby-rspec)
makedepends=(git)
conflicts=('vimgolf')
provides=('vimgolf')

source=("$_gemname::git://github.com/igrigorik/$_gemname.git")
md5sums=('SKIP')

build(){
  cd "$srcdir/$_gemname"

  gem build "$_gemname.gemspec"

}
package() {
  cd "$srcdir/$_gemname"

  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  msg2 "Gem install to $pkgdir"

  _gemfile="$(find . -type f -name "$_gemname"*.gem)"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemfile"

}

# vim:set ts=2 sw=2 et:
