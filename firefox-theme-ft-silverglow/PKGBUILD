# Maintainer: M0Rf30

pkgname=firefox-theme-ft-silverglow
pkgdesc="Smooth silver theme for Firefox."
pkgver=2.6
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/fr/firefox/addon/bloomind-ft-silverglow/"
depends=("firefox>=8.0" "firefox<=13.0")
license=('custom')
source=("https://addons.mozilla.org/firefox/downloads/file/150142/ft_silverglow-${pkgver}-fx-linux.jar")

build() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/extensions/${emid}
  install -d $dstdir
  #sed -i 's#<em:maxVersion>.*</em:maxVersion>#<em:maxVersion>10.*</em:maxVersion>#' install.rdf
  rm *.jar
  mv * $dstdir
}

md5sums=('12bd6ef48811b3047948a21254f0e94b')
