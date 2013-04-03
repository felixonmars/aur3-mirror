# Maintainer: Giancarlo Bianchi <giancarlobianchi -ADD 76 TO THE NAME- @gmail.com>

pkgname=firefox-theme-fxchrome
_pkgname=fxchrome
pkgver=20.1
pkgrel=1
pkgdesc="Chrome/Chromium like theme for Firefox"
url="https://addons.mozilla.org/en-US/firefox/addon/fxchrome/"
arch=('any')
license=('MPL')
depends=("firefox")
noextract=("${_pkgname}-${pkgver}-fx-linux.xpi")
source=("https://addons.cdn.mozilla.net/storage/public-staging/287749/${_pkgname}-${pkgver}-fx-linux.xpi")
md5sums=('11c4fb8f9a8a15ea530242b0a792ed5f')

package() {
  cd "$srcdir"
  [[ -d "${_pkgname}" ]] || mkdir -p "$pkgname"
  bsdtar -xf ${_pkgname}-${pkgver}-fx-linux.xpi -C "$pkgname"

  cd "$pkgname"
  local emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local dstdir=$pkgdir/usr/lib/firefox/extensions/${emid}
  install -d $dstdir
  #sed -i 's#<em:maxVersion>.*</em:maxVersion>#<em:maxVersion>10.*</em:maxVersion>#' install.rdf

  cp -R * ${dstdir}
  find ${pkgdir} -type d -exec chmod 0755 {} \;
  find ${pkgdir} -type f -exec chmod 0644 {} \;
}

# vim:set ts=2 sw=2 et:
