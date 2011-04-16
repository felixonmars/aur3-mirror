# Maintainer: David Campbell <davekong@archlinux.us>
pkgname=ronn
pkgver=0.7.3
pkgrel=4
pkgdesc="Builds manuals"
arch=('any')
url="http://rtomayko.github.com/ronn/"
license=('custom')
depends=('ruby' 'ruby-hpricot' 'ruby-rdiscount' 'ruby-mustache')
makedepends=('rubygems')
source=("http://gems.rubyforge.org/gems/ronn-${pkgver}.gem")
noextract=("ronn-${pkgver}.gem")
md5sums=('c5aa4ef58d35d0cc635b769281e03225')

build () {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" ronn-$pkgver.gem \
  -n "$pkgdir/usr/bin"

  install -Dm644 $pkgdir/usr/lib/ruby/gems/1.9.1/gems/ronn-$pkgver/COPYING \
                 $pkgdir/usr/share/licenses/$pkgname/COPYING
  install -Dm644 $pkgdir/usr/lib/ruby/gems/1.9.1/gems/ronn-$pkgver/man/ronn.1 \
                 $pkgdir/usr/share/man/man1/ronn.1
  install -Dm644 $pkgdir/usr/lib/ruby/gems/1.9.1/gems/ronn-$pkgver/man/ronn-format.7 \
                 $pkgdir/usr/share/man/man7/ronn-format.7
}

# vim:set ts=2 sw=2 et:
