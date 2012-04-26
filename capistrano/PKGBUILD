# Maintainer: Adam Russell <adamlr6+arch@gmail.com>
pkgname=capistrano
pkgver=2.12.0
pkgrel=1
pkgdesc="A tool for automating tasks on one or more remote servers"
arch=('i686' 'x86_64')
url="http://rubygems.org/gems/capistrano"
license=('MIT')
depends=('ruby' 'ruby-net-ssh>=2.0.14' 'ruby-net-ssh-gateway>=1.1.0' 'ruby-net-sftp>=2.0.0' 'ruby-net-scp>=1.0.0' 'ruby-highline')
source=(http://gems.rubyforge.org/gems/capistrano-$pkgver.gem)
noextract=(capistrano-$pkgver.gem)
md5sums=('a3cd2911f5c28279386128f26c42ecbe')

build() {
	cd "${srcdir}"
	local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin/" capistrano-$pkgver.gem
}
