# Maintainer: Tianjiao Yin <ytj000+aur@gmail.com>

pkgname=firefox-theme-bloomind-ft-deepdark
pkgdesc="Smooth dark theme for Firefox."
pkgver=2.9.8.4
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/firefox/addon/295337"
depends=("firefox>=8.0" "firefox<=13.0")
license=('custom')
source=("https://addons.mozilla.org/firefox/downloads/file/143103/ft_deepdark-2.9.8.4-fx-linux.jar")

build() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/extensions/${emid}
  install -d $dstdir
  #sed -i 's#<em:maxVersion>.*</em:maxVersion>#<em:maxVersion>10.*</em:maxVersion>#' install.rdf
  rm *.jar
  mv * $dstdir
}
md5sums=('b01d6810d794eb72b46fa906ca0635fd')
