# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-rails-aio
pkgver=3.2.11
#Core
_actionmailer_pkgver=${pkgver}
_actionpack_pkgver=${pkgver}
_activemodel_pkgver=${pkgver}
_activerecord_pkgver=${pkgver}
_activeresource_pkgver=${pkgver}
_activesupport_pkgver=${pkgver}
_bundler_pkgver=1.1.4
_rails_pkgver=${pkgver}
_railties_pkgver=${pkgver}
#Depends
_arel_pkgver=3.0.2
_builder_pkgver=3.0.0
_erubis_pkgver=2.7.0
_hike_pkgver=1.2.1
_i18n_pkgver=0.6.1
_journey_pkgver=1.0.4
_json_pkgver=1.7.6
_mail_pkgver=2.5.3
_mime_types_pkgver=1.19
_multi_json_pkgver=1.5.0
_polyglot_pkgver=0.3.3
_rack_pkgver=1.4.3
_rack_cache_pkgver=1.2
_rack_ssl_pkgver=1.3.2
_rack_test_pkgver=0.6.2
_sprockets_pkgver=2.2.1
_thor_pkgver=0.16.0
_tilt_pkgver=1.3.3
_treetop_pkgver=1.4.12
_tzinfo_pkgver=0.3.35
pkgrel=1
pkgdesc="The open source web application framework for the Ruby programming language."
arch=(any)
url="http://www.rubyonrails.org"
license=('MIT')
depends=('ruby' 'rubygems')
provides=("ruby-actionmailer=${_actionmailer_pkgver}" "ruby-actionpack=${_actionpack_pkgver}" "ruby-activemodel=${_activemodel_pkgver}" \
          "ruby-activerecord=${_activerecord_pkgver}" "ruby-activeresource=${_activeresource_pkgver}" "ruby-activesupport=${_activesupport_pkgver}" \
          "ruby-arel=${_arel_pkgver}" "ruby-builder=${_builder_pkgver}" "ruby-bundler=${_bundler_pkgver}" "ruby-erubis=${_erubis_pkgver}" \
          "ruby-hike=${_hike_pkgver}" "ruby-i18n=${_i18n_pkgver}" "ruby-journey=${_journey_pkgver}" "ruby-json=${_json_pkgver}" \
          "ruby-mail=${_mail_pkgver}" "ruby-mime-types=${_mime_types_pkgver}" "ruby-multi_json=${_multi_json_pkgver}" "ruby-polyglot=${_polyglot_pkgver}" \
          "ruby-rack=${_rack_pkgver}" "ruby-rack-cache=${_rack_cache_pkgver}" "ruby-rack-ssl=${_rack_ssl_pkgver}" "ruby-rack-test=${_rack_test_pkgver}" \
          "ruby-rails=${pkgver}" "ruby-railties=${_railties_pkgver}" "ruby-sprockets=${_sprockets_pkgver}" "ruby-thor=${_thor_pkgver}" "ruby-tilt=${_tilt_pkgver}" \
          "ruby-treetop=${_treetop_pkgver}" "ruby-tzinfo=${_tzinfo_pkgver}")

conflicts=('ruby-rack' 'ruby-rack110' 'ruby-rack1xx' 'rails' 'ruby-rails' 'ruby-rails2xx' 'ruby-rails2xx-aio')

source=(http://gems.rubyforge.org/gems/actionmailer-${_actionmailer_pkgver}.gem
        http://gems.rubyforge.org/gems/actionpack-${_actionpack_pkgver}.gem
        http://gems.rubyforge.org/gems/activemodel-${_activemodel_pkgver}.gem
        http://gems.rubyforge.org/gems/activerecord-${_activerecord_pkgver}.gem
        http://gems.rubyforge.org/gems/activeresource-${_activeresource_pkgver}.gem
        http://gems.rubyforge.org/gems/activesupport-${_activesupport_pkgver}.gem
        http://gems.rubyforge.org/gems/bundler-${_bundler_pkgver}.gem
        http://gems.rubyforge.org/gems/rails-${_rails_pkgver}.gem
        http://gems.rubyforge.org/gems/railties-${_railties_pkgver}.gem
        http://gems.rubyforge.org/gems/arel-${_arel_pkgver}.gem
        http://gems.rubyforge.org/gems/builder-${_builder_pkgver}.gem
        http://gems.rubyforge.org/gems/erubis-${_erubis_pkgver}.gem
        http://gems.rubyforge.org/gems/hike-${_hike_pkgver}.gem
        http://gems.rubyforge.org/gems/i18n-${_i18n_pkgver}.gem
        http://gems.rubyforge.org/gems/journey-${_journey_pkgver}.gem
        http://gems.rubyforge.org/gems/json-${_json_pkgver}.gem
        http://gems.rubyforge.org/gems/mail-${_mail_pkgver}.gem
        http://gems.rubyforge.org/gems/mime-types-${_mime_types_pkgver}.gem
        http://gems.rubyforge.org/gems/multi_json-${_multi_json_pkgver}.gem
        http://gems.rubyforge.org/gems/polyglot-${_polyglot_pkgver}.gem
        http://gems.rubyforge.org/gems/rack-${_rack_pkgver}.gem
        http://gems.rubyforge.org/gems/rack-cache-${_rack_cache_pkgver}.gem
        http://gems.rubyforge.org/gems/rack-ssl-${_rack_ssl_pkgver}.gem
        http://gems.rubyforge.org/gems/rack-test-${_rack_test_pkgver}.gem
        http://gems.rubyforge.org/gems/sprockets-${_sprockets_pkgver}.gem
        http://gems.rubyforge.org/gems/thor-${_thor_pkgver}.gem
        http://gems.rubyforge.org/gems/tilt-${_tilt_pkgver}.gem
        http://gems.rubyforge.org/gems/treetop-${_treetop_pkgver}.gem
        http://gems.rubyforge.org/gems/tzinfo-${_tzinfo_pkgver}.gem)

noextract=(actionmailer-${_actionmailer_pkgver}.gem
           actionpack-${_actionpack_pkgver}.gem
           activemodel-${_activemodel_pkgver}.gem
           activerecord-${_activerecord_pkgver}.gem
           activeresource-${_activeresource_pkgver}.gem
           activesupport-${_activesupport_pkgver}.gem
           bundler-${_bundler_pkgver}.gem
           rails-${_rails_pkgver}.gem
           railties-${_railties_pkgver}.gem
           arel-${_arel_pkgver}.gem
           builder-${_builder_pkgver}.gem
           erubis-${_erubis_pkgver}.gem
           hike-${_hike_pkgver}.gem
           i18n-${_i18n_pkgver}.gem
           journey-${_journey_pkgver}.gem
           json-${_json_pkgver}.gem
           mail-${_mail_pkgver}.gem
           mime-types-${_mime_types_pkgver}.gem
           multi_json-${_multi_json_pkgver}.gem
           polyglot-${_polyglot_pkgver}.gem
           rack-${_rack_pkgver}.gem
           rack-cache-${_rack_cache_pkgver}.gem
           rack-ssl-${_rack_ssl_pkgver}.gem
           rack-test-${_rack_test_pkgver}.gem
           sprockets-${_sprockets_pkgver}.gem
           thor-${_thor_pkgver}.gem
           tilt-${_tilt_pkgver}.gem
           treetop-${_treetop_pkgver}.gem
           zinfo_pkgver}.gem)

sha256sums=('d662519c476570cd2d6c2410348c5e55980e4b210829db33c59896ef6698488a'
            '78d9fcf36e216fce51c6e6ea76b4cd794e7fd2ca2753adca9b2ed038fc02da46'
            'ce22a1190d2499317264d19b11712d648fa71b058a3fcc55cb5799b33938ae60'
            '9c0ec9eadf522918ad6709eedbc89c15ea6cce8186ac9dd13dd2340e89093011'
            '909035667a7fbda197c9779a92693b6ed8a51b6a11b324ea45c0aa840a755d5e'
            '3ae175b724405597b3055cab020a52d3e8c2877734bfee10aa0ea210f82ed1b7'
            '203f23d42f175f3a66e3c882821f207187bb2cdcbb86ff76ab2df700e624f28e'
            'f5e02999889aa39af2c7d2c882d9e3b5c71e8adfc98236a69dadacdfbce5603e'
            'bc250077581de169e067db1e2aeb528f09dccfa2520f707b1970b2a9a551563e'
            '7d5e9c081444fa4d6a0bba70d3ddf56d9592658dafa59ffca4ebd6aa60de0b95'
            'fbd3e15e5de02245f7d649b3415b2c2875cdc9a14dccde89aa30fc14a314618e'
            '63653f5174a7997f6f1d6f465fbe1494dcc4bdab1fb8e635f6216989fb1148ba'
            'ebbc0c3667496abf91b534260e2828c554c537fcac18d99e39d2a698947ce8b0'
            'd4ad6826f785a07b343f003886fc297fcacb3a84234dd3b16b6406bac3857474'
            '7454b8612530784000fbb17ea2df749a71b70702a0ac8ebef4a1e7f05aecc10f'
            '4aa06575429fd28919d137dccb8b3c11bd0518466d94dc185fffc8fa3f6bb008'
            '338dfc39e30665402aade821584970502e1e039fd972731fc95beff3991ad9a9'
            '4658ed1c3945625e2b1464061ef5d1163d2fb101a14fa9bc04d1ec347fa684ac'
            'e94cf8a6db88eb35657b20f5a17631fcc7e46a867f798fce7ef09944442d673a'
            '1b0026fa0ce5aef4a65199ff3f5c589a4865265cd1f2f053eb6c4041a3aa5f20'
            'e16392baa87833c0eb51afcec13f96a521339af183032fa211b6d31e57f320df'
            '02bfed05f8b3266db804f2fa445801636ca2c6d211a3137ec796f88af5756e1c'
            '36f30465de6d928b633c851f84b041547277145db6ac1dea7c1197c48a7537c1'
            '7e920b6aac888e4a3846e5997fb1cbf456bdb5846322b58dc31697a54a38b306'
            '763f01c3c74662b64becf9f748c564d07e070f910e794ad72b42d589f4e7aeef'
            '864aa9842885f554d9750a4df3c2869afd20a2914b24f421c8bb3e4d00a982cf'
            '48af9536c7699dc0f8f50ba2432b627a3f47f9702d2d25d48dfc2d4a2da20da3'
            '88f5e7cd9ef77ae2d1eca62f87640e74865d4c9242837e41d563247b0c968eca'
            'b72ee96326a85fd2d8ccef97d94d10d15e46194aae2fca28ecef768665b3a2b0')

_gem_list=(actionmailer-${_actionmailer_pkgver}
		actionpack-${_actionpack_pkgver}
		activemodel-${_activemodel_pkgver}
		activerecord-${_activerecord_pkgver}
		activeresource-${_activeresource_pkgver}
		activesupport-${_activesupport_pkgver}
		bundler-${_bundler_pkgver}
		rails-${_rails_pkgver}
		railties-${_railties_pkgver}
		arel-${_arel_pkgver}
		builder-${_builder_pkgver}
		erubis-${_erubis_pkgver}
		hike-${_hike_pkgver}
		i18n-${_i18n_pkgver}
		journey-${_journey_pkgver}
		json-${_json_pkgver}
		mail-${_mail_pkgver}
		mime-types-${_mime_types_pkgver}
		multi_json-${_multi_json_pkgver}
		polyglot-${_polyglot_pkgver}
		rack-${_rack_pkgver}
		rack-cache-${_rack_cache_pkgver}
		rack-ssl-${_rack_ssl_pkgver}
		rack-test-${_rack_test_pkgver}
		sprockets-${_sprockets_pkgver}
		thor-${_thor_pkgver}
		tilt-${_tilt_pkgver}
		treetop-${_treetop_pkgver}
		tzinfo-${_tzinfo_pkgver})

package() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  for _gem_name in ${_gem_list[*]}
    do gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gem_name}.gem
  done
}
