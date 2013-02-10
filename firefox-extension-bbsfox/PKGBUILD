pkgname=firefox-extension-bbsfox
pkgver=2.0.56
pkgrel=2
_addons_file=179388
pkgdesc="A GNU/GPL telnet client extension specifically designed for BBS browsing under firefox."
arch=('any')
url="http://forum.moztw.org/viewtopic.php?f=11&t=30217"
license=('GPLv2')
depends=('firefox')
source=(https://addons.mozilla.org/firefox/downloads/latest/${_addons_file}/addon-${_addons_file}-latest.xpi)
md5sums=('c179b3fc064711a1a09ae434f07b89e5')

build() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/extensions/${emid}
  install -d $dstdir
  sed -i 's#<em:maxVersion>.*</em:maxVersion>#<em:maxVersion>11.*</em:maxVersion>#' install.rdf
  rm *.xpi
  mv * $dstdir
}