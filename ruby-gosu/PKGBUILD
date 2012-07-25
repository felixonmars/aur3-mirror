# Maintainer: Henning Bekel <h dot bekel at googlemail dot com>

pkgname=ruby-gosu
pkgver=0.7.44
pkgrel=1
pkgdesc="2D game development library for the Ruby programming language."
arch=('i686' 'x86_64')
url="http://code.google.com/p/gosu/"
license='MIT'
makedepends=('boost' 'swig')
depends=('ruby' 'libsndfile' 'openal' 'freeimage' 'sdl_ttf' 'pango' 'libgl')
source=("http://rubygems.org/downloads/gosu-${pkgver}.gem")
md5sums=('7cdd67dca83667d53e04b1db16f6eec4')

build() {
  cd "$srcdir"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install \
    -i "${pkgdir}/$(gem environment gemdir)" "gosu-${pkgver}.gem"

  #tar vxzf data.tar.gz
  #install -D -m 644 COPYING.txt $pkgdir/usr/share/licenses/$pkgname/COPYING
}
