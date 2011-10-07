# Maintainer: Allen Choong <allen dot choong at gmail dot com>
pkgname=firefox-moonlight64
pkgver=3.99.0.3
pkgrel=1
pkgdesc="Alternative Silverlight plugin, Moonlight 64-bit, for Firefox"
arch=('x86_64')
url="http://www.go-mono.com/moonlight/download.aspx"
license=('LGPL')
depends=("firefox")
makedepends=('unzip')
source=(http://www.go-mono.com/moonlight/downloads/3.99.0.3/novell-moonlight-${pkgver}-${arch}.xpi)
md5sums=('0653dfbbd488bcebccf0a906f08465c1')

build() {
  _ffver=`pacman -Q firefox | cut -f2 -d\ | cut -f1-2 -d.`
#  depends=("firefox>=${_ffver}" "firefox<=${_ffver/0/99}")

  cd $srcdir
  rm -Rf META-INF
  local emid=moonlight@novell.com
  local dstdir=$pkgdir/usr/lib/firefox-$_ffver/extensions/${emid}
  install -d $dstdir
  sed -i 's#<em:maxVersion>.*</em:maxVersion>#<em:maxVersion>7.*</em:maxVersion>#' install.rdf
  cp -R * $dstdir
  rm $dstdir/novell-moonlight-${pkgver}-${arch}.xpi
}

