# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
_gemname=vimgolf
pkgname=vimgolf
pkgver=0.4.5
pkgrel=1
pkgdesc="Cli application to test your vim ninja skills"
arch=(any)
url="http://vimgolf.com/"
license=('GPL')
depends=(ruby ruby-highline ruby-thor ruby-rspec)
source=("git://github.com/igrigorik/vimgolf.git#commit=v$pkgver"
        'notgit.patch')
md5sums=('SKIP'
         '497e69e17d2098062ab5097ef18c631b')

build(){
  cd "$srcdir/vimgolf"

  # patch -Np1 -i "$srcdir/notgit.patch"

  gem build "$pkgname.gemspec"
}
package() {
  cd "$srcdir/vimgolf"

  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

}

# vim:set ts=2 sw=2 et:
