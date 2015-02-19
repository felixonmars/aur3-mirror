# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=ruby-atomic
pkgver=1.1.99
pkgrel=1
pkgdesc="An atomic reference implementation for JRuby, Rubinius, and MRI"
arch=('i686' 'x86_64')
url='https://github.com/ruby-concurrency/atomic'
license=('APACHE')
depends=('ruby')
source=("http://gems.rubyforge.org/gems/atomic-${pkgver}.gem")
noextract=("atomic-${pkgver}.gem")
sha256sums=('093fa4d0522bfac61b4793b00c8e14dae846d5c1d28fa9dd6ab6112be1ce09ce')

package() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" "atomic-${pkgver}.gem"
}
