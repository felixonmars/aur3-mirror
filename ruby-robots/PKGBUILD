# Contributor: Sebastien Duquette <ekse.0x@gmail.com>
# Maintainer: Nikolay Bogoychev <nheart@gmail.com>
pkgname=ruby-robots
pkgver=0.10.1
pkgrel=1
pkgdesc="Ruby gem robots is a robots.txt parser"
arch=(any)
url="http://github.com/fizx/robots"
license=('GPL')
depends=('ruby')
makedepends=('rubygems')
source=("http://gems.rubyforge.org/gems/robots-$pkgver.gem")
noextract=("robots-$pkgver.gem")
md5sums=('7352bcc0113f814086a3bd1eb51912b1')

build() {
  cd $srcdir
  # _gemdir is defined inside build() because if ruby[gems] is not installed on the system
  #  makepkg will barf when sourcing the PKGBUILD
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" robots-$pkgver.gem
}

# vim:set ts=2 sw=2 et:

