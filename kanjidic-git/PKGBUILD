# Contributor: Sloonz <sloonz+aur@gmail.com>

pkgname=kanjidic-git
pkgver=r10.b5bdddd
pkgrel=1
pkgdesc="Kanji dictionary with multiradical, fuzzy SKIP and stroke count search"
arch=(i686 x86_64)
url="http://github.com/sloonz/kanjidic"
license=(BSD)
depends=(ruby-gtk3)
source=("kanjidic"::"git://github.com/sloonz/kanjidic.git")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/kanjidic"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/kanjidic"
  gem build kanjidic.gemspec
}

package() {
  cd "$srcdir/kanjidic"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-ri --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" kanjidic-*.gem &&
    install -d $pkgdir/usr/bin &&
    ln -s "$_gemdir/bin/kanjidic" "$pkgdir/usr/bin/kanjidic"
}
