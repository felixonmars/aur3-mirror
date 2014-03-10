# Maintainer: Jonathan Steel <jsteel at aur.archlinux.org>
# Contributor: Sid Karunaratne <sid@karunaratne.net>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>

_gemname=listen
pkgname=ruby-listen-2.4
pkgver=2.4.1
pkgrel=1
pkgdesc="The Listen gem listens to file modifications and notifies you about the changes. Works everywhere!"
arch=('any')
url="https://rubygems.org/gems/listen"
license=('MIT')
depends=('ruby' 'ruby-rb-inotify>=0.9' 'ruby-rb-fsevent>=0.9.3' 'ruby-celluloid')
provides=('ruby-listen')
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
md5sums=('3aa13bda9f4ab9e82866f760cb60f59a')

package() {
  cd "$srcdir"

  local _gemdir="$( ruby -rubygems -e'puts Gem.default_dir' )"

  gem install --ignore-dependencies --no-user-install \
    -i "$pkgdir/$_gemdir" $_gemname-$pkgver.gem
}

