# Maintainer: kulpae <kulpae @ google mail>

pkgname=cloudruby-git
_gitname="cloudruby"
pkgver=23.7454edb
pkgrel=1
pkgdesc="Ncurses player for Soundcloud tracks in Ruby"
arch=('i686' 'x86_64')
url="https://github.com/kulpae/cloudruby"
license=(custom)
depends=('ruby' 'mpg123' 'ncurses')
makedepends=('git')
provides=('cloudruby')
conflicts=('cloudruby')
# ruby-ncurses.. 0_o
source=($_gitname::git://github.com/kulpae/cloudruby.git)
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install curses json_pure --install-dir "${pkgdir}/$_gemdir" --no-user-install

  cd "$_gitname"

  install -dm 755 "${pkgdir}"/usr/{bin,lib/${_gitname},share/licenses/${pkgname}}/

  ln -s ../lib/${_gitname}/cloudruby "${pkgdir}/usr/bin/cloudruby"

  install -m 755 cloudruby       "${pkgdir}/usr/lib/${_gitname}/"
  install -m 644 mpg123player.rb "${pkgdir}/usr/lib/${_gitname}/"
  install -m 644 ncurses_ui.rb   "${pkgdir}/usr/lib/${_gitname}/"
  install -m 644 soundcloud.rb   "${pkgdir}/usr/lib/${_gitname}/"
  install -m 644 LICENSE         "${pkgdir}/usr/share/licenses/${pkgname}/"
}
