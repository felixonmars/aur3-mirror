# Contributor: oliparcol <oliparcol AT gmail DOT com>
pkgname=ruby-albino
pkgver=1.3.3
pkgrel=4
pkgdesc="Ruby wrapper for pygmentize."
arch=(any)
url="http://github.com/github/albino"
license=('MIT')
depends=(ruby
        'ruby-posix-spawn>=0.3.6'
        'python2-pygments')

makedepends=(rubygems)
source=(http://rubygems.org/downloads/albino-$pkgver.gem 
        LICENSE)
md5sums=('3a2fe2fc450acc2b3fb61105d67be3a4'
         '57ead4ca99286a81c46637778531d545')
noextract=(albino-$pkgver.gem)

build() {
        cd $srcdir
        local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

        gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" albino-$pkgver.gem

        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
