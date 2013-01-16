# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-rails2xx-aio
pkgver=2.3.15
_rack_pkgver=1.1.3
pkgrel=1
pkgdesc="The open source web application framework for the Ruby programming language."
arch=(any)
url="http://www.rubyonrails.org/"
license=('MIT')
depends=('ruby' 'rubygems')
provides=("ruby-rack=${_rack_pkgver}" "ruby-activeresource=${pkgver}" "ruby-actionmailer=${pkgver}"
          "ruby-actionpack=${pkgver}" "ruby-activerecord=${pkgver}" "ruby-activesupport=${pkgver}" "ruby-rails=${pkgver}")
conflicts=('ruby-rack' 'ruby-rack110' 'ruby-rack1xx' 'ruby-rails' 'ruby-rails-aio' 'ruby-rails2xx' 'ruby-rails2xx-aio')
source=(http://rubygems.org/downloads/activeresource-${pkgver}.gem
         http://rubygems.org/downloads/actionmailer-${pkgver}.gem
         http://rubygems.org/downloads/actionpack-${pkgver}.gem
         http://rubygems.org/downloads/activerecord-${pkgver}.gem
         http://rubygems.org/downloads/activesupport-${pkgver}.gem
         http://rubygems.org/downloads/rack-${_rack_pkgver}.gem
         http://rubygems.org/downloads/rails-${pkgver}.gem
         )

noextract=(activeresource-${pkgver}.gem
         actionmailer-${pkgver}.gem
         actionpack-${pkgver}.gem
         activerecord-${pkgver}.gem
         activesupport-${pkgver}.gem
         rack-${_rack_pkgver}.gem
         rails-${pkgver}.gem
         )

sha256sums=('95999b7b46290d8c62d39d573a30bb223af851e528746fe1438bcc98704ad9fa'
            '9b635cfff21a47f69d4e2ed4080597a94a86a4d627734128e41c8ae9bcd4317a'
            '7fe685d93655ded1b5f2a63617c0bc1fa9b7a0a755680771fca44bc60dca0ffd'
            '2f97c0f8346466f5125f8181f00cd2162e915b5205162abb8ae2f5d72c7406e8'
            '2528988dba42992c61f0c55935a840bee782418adc18f8ce67d0a80cf1f437bc'
            'e774004d0229a82835d21fcfed2feda1b0df1fe7e609d3d4324660890a57ac3e'
            '21c177e2577faa9d09319a965870ee5f03d944d2e558573df852659cd729a79e')

_gem_list=(activeresource-${pkgver}
         actionmailer-${pkgver}
         actionpack-${pkgver}
         activerecord-${pkgver}
         activesupport-${pkgver}
         rack-${_rack_pkgver}
         rails-${pkgver}
         )

package() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  for _gemname in ${_gem_list[*]}
  do gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}.gem
  done
}
