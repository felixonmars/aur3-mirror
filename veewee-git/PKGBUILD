# Maintainer: Anshuman Bhaduri <anshuman (dot) bhaduri 0 (at) gmail (dot) com>

_gemname=veewee
pkgname=$_gemname-git
#pkgver=v0.3.7.537.g3a48c82
pkgver=0.3.8.dev
pkgrel=1
pkgdesc="A tool for building custom Vagrant base boxes and virtual machine images."
arch=('any')
url="https://github.com/jedi4ever/veewee"
license=('MIT')
depends=('ruby' 'rubygems' 'ruby-ansi-1.3' 'ruby-childprocess' 'ruby-thor<1' \
         'ruby-vnc<1.1' 'ruby-progressbar' 'ruby-net-ssh' 'ruby-i18n' \
         'ruby-highline' 'ruby-fission=0.4.0' 'ruby-popen4<0.2' 'ruby-grit' \
         'ruby-fog<2' 'ruby-json' 'ruby-whichr')
makedepends=('git' 'ruby-bundler')
provides=('veewee')
conflicts=('veewee')
source=('git://github.com/jedi4ever/veewee.git')
sha1sums=('SKIP')

pkgver() {
  #cd ${_gemname}
  #git describe --always | sed 's|-|.|g'
  echo "0.3.8.dev"
}

build() {
  cd "${srcdir}"/${_gemname}
  
  bundle install --path=bundle
  bundle exec rake build
}

package() {
  cd "${srcdir}"/${_gemname}
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  #local _version="$(git describe --abbrev=0)"
  local _version="v0.3.8.dev"

  HOME=/tmp gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n "${pkgdir}"/usr/bin "pkg/${_gemname}-${_version#v}.gem"

  install -Dm644 License "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  # Remove VCS leftovers.
  find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
}
