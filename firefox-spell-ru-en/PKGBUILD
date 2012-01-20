# Contributor: Nazarov Pavel <nazarov.pn@gmail.com>

pkgname=firefox-spell-ru-en
pkgver=1.0.0.1
_ffver=6.0
pkgrel=8
pkgdesc="Russian/English spellchecker dictionary for Firefox"
arch=(any)
url="http://ftp.mozilla-russia.org/dictionaries/"
license=("GPL")
depends=("firefox")
noextract=(http://ftp.mozilla-russia.org/dictionaries/ru-en_spell_dictionary.xpi)
source=(http://ftp.mozilla-russia.org/dictionaries/ru-en_spell_dictionary.xpi)
md5sums=('f0eb323a797dbad454f9c44932903d65')


build() {
  cd $srcdir && \
  rm $srcdir/*.xpi

  #local _dir=$pkgdir/usr/lib/firefox-${_ffver}/extensions/ru-en@dictionaries.addons.mozilla.org
  local _dir=$pkgdir/usr/lib/firefox/extensions/ru-en@dictionaries.addons.mozilla.org
  mkdir -p "${_dir}"
  cd "${_dir}" && \
  #sed -i 's#<em:maxVersion>.*</em:maxVersion>#<em:maxVersion>5.0.*</em:maxVersion>#' $srcdir/install.rdf && \
  cp -r $srcdir/* "${_dir}" && \
  find ${_dir} -type f -exec chmod 0644 {} \; && \
  touch ${_dir}/chrome.manifest
}

