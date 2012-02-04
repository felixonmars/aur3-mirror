# Maintainer: Romain Schmitz <myself at slopjong dot de>
pkgname=ruby1.8-rails
pkgver=2.3.14
pkgrel=1
pkgdesc="Is an open source web application framework for the Ruby programming language."
arch=(any)
url="http://www.rubyonrails.org"
license=('MIT')
depends=('ruby1.8-rack' 'rubygems1.8')
provides=('ruby-activeresource=2.3.14' 'ruby-actionmailer=2.3.14' 'ruby-actionpack=2.3.14'
          'ruby-activerecord=2.3.14' 'ruby-activesupport=2.3.14' 'ruby-rails=2.3.14')
conflicts=('rails' 'ruby-rails' 'ruby-rails-aio' 'ruby-rails2xx' 'ruby-rails2xx-aio')
source=(http://rubygems.org/downloads/activeresource-${pkgver}.gem
         http://rubygems.org/downloads/actionmailer-${pkgver}.gem
         http://rubygems.org/downloads/actionpack-${pkgver}.gem
         http://rubygems.org/downloads/activerecord-${pkgver}.gem
         http://rubygems.org/downloads/activesupport-${pkgver}.gem
         http://rubygems.org/downloads/rails-${pkgver}.gem
         )

noextract=(activeresource-${pkgver}.gem
         actionmailer-${pkgver}.gem
         actionpack-${pkgver}.gem
         activerecord-${pkgver}.gem
         activesupport-${pkgver}.gem
         rails-${pkgver}.gem
         )

md5sums=('f29d192724ad1e1b3445f573e7c35a98'
         'b7c5ce36c1f5af30ac6fb34ca7c9237e'
         '37078d46204342eccf6827f266122b64'
         '412f03f155bf0704c8ecb211a5d9da16'
         '2287a8a769cc4ecca94d3c5b867a874c'
         '10177c63d1b943861ccce031cb22c100')

_gem_list=(activeresource-${pkgver}
         actionmailer-${pkgver}
         actionpack-${pkgver}
         activerecord-${pkgver}
         activesupport-${pkgver}
         rails-${pkgver}
         )

build() {
  cd "${srcdir}"
  local _gemdir="$(ruby-1.8 -rubygems -e'puts Gem.default_dir')"
  install -d ${pkgdir}/usr/bin
  for _gemname in ${_gem_list[*]}
  do gem-1.8 install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}.gem
  done
}
