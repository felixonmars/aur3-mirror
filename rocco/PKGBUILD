# Maintainer: Ivan c00kiemon5ter Kanakarakis <ivan.kanak@gmail.com>
pkgname="rocco"
pkgver=0.8.1
pkgrel=1
pkgdesc="Ruby port of Docco, literate-programming-style documentation generator"
arch=('any')
url="http://rtomayko.github.com/rocco/"
license=('MIT')
depends=('ruby' 'ruby-mustache' 'ruby-rdiscount')
makedepends=('rubygems')
source=("http://rubygems.org/downloads/$pkgname-$pkgver.gem")
noextract=("$pkgname-$pkgver.gem")
sha256sums=('07f3330d59d934a6a78f988f725eb042f9adbd092180ad33574d90096c797981')

build() {
  cd "$srcdir"
  # _gemdir is defined inside build()
  # if ruby[gems] is not installed on the system
  # makepkg will barf when sourcing the PKGBUILD
  _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --verbose -i "$pkgdir$_gemdir" -n "$pkgdir"/usr/bin "$pkgname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
