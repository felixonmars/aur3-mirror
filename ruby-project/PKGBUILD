# Maintainer: Your Name <chris@nu7hat.ch>

pkgname='ruby-project'
pkgver='1.3.0'
pkgrel=1
pkgdesc='A streamlined approach to working with multiple projects and tasks'
arch=('any')
url='http://rubygems.org/gems/project'
license=('MIT')
groups=('ruby')
depends=('ruby>=1.9', 'ruby-rspec>=1.2.9')
source=(https://rubygems.org/downloads/project-$pkgver.gem)
noextract=(project-$pkgver.gem)
md5sums=('e8884b5c46382ec826f5c8b923f3949d')

build() {
    cd "$srcdir"
    local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
    gem install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin/" project-$pkgver.gem
}