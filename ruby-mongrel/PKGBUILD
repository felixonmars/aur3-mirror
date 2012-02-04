# Contributor: gem2arch 0.1
pkgname=ruby-mongrel
pkgver=1.1.5
_realname="mongrel"
pkgrel=4
pkgdesc="A small fast HTTP library and server that runs Rails, Camping, Nitro and Iowa apps."
arch=(any)
url="http://gemcutter.org/gems/mongrel"
license=("GPL")
depends=('ruby' 'ruby-daemons' 'ruby-cgi_multipart_eof_fix' 'ruby-echoe' 'ruby-gemcutter' 'ruby-json_pure' 'ruby-gem_plugin' 'ruby-fastthread')
makedepends=('git')

_gitroot="http://github.com/taf2/mongrel.git"

build() {
	local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
	cd "$srcdir"

	msg "Connecting to GIT server...."

	if [ -d $_realname ] ; then
			cd $_realname && git pull origin
			msg "The local files are updated."
	else
			git clone $_gitroot $_realname
			cd $_realname
	fi

	msg "GIT checkout done or server timeout"

	ruby setup.rb config
	rake gem
	cd pkg
	gem install --ignore-dependencies "${_realname}" -l -i "$pkgdir$_gemdir"
}
