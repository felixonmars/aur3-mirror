# Contributor: Aline Freitas <aline@bsd.com.br>

pkgname=firefox-spell-pt-br
pkgver=2.1.1
_fx_ver=2.0
pkgrel=1
pkgdesc="Brazilian Portuguese language dictionary (spellcheker) for Firefox"
arch=(any)
url="https://addons.mozilla.org/firefox/dictionaries/"
license="GPL"
depends=("firefox>=${_fx_ver}")
source=(http://releases.mozilla.org/pub/mozilla.org/addons/6081/verificador_ortografico_para_portugues_do_brasil-${pkgver}-2.0-tb+fn+sm+fx.xpi)
md5sums=('b8fe6c441d6b317d98f8d0851864b5bd')

build() {

  cd $srcdir
  rm $srcdir/*.xpi
  local _dir=$pkgdir/usr/lib/firefox/extensions/pt-br@dictionaries.addons.mozilla.org
  mkdir -p "${_dir}"
  cd "${_dir}"
  sed -i 's#<em:maxVersion>.*</em:maxVersion>#<em:maxVersion>20.*</em:maxVersion>#' $srcdir/install.rdf
  cp -r $srcdir/* "${_dir}"
  find ${_dir} -type f -exec chmod 0644 {} \;
  touch ${_dir}/chrome.manifest

}
