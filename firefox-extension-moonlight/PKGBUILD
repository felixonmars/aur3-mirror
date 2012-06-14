# Maintainer: dongfengweixiao <dongfengweixiao@gmail.com>

_plugin_name=moonlight
_plugin_version=3.99.0.3
license=('MPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgdesc="An open source implementation of Microsoft Silverlight for Unix systems. With Moonlight you can access videos, applications and content created for Silverlight on Linux. "
pkgrel=1
arch=('i686' 'x86_64')
url="http://mono-project.com/Moonlight"
depends=("firefox")

if [ "$CARCH" = "i686" ]; then
    source=("http://www.go-mono.com/moonlight/downloads/3.99.0.3/novell-moonlight-3.99.0.3-i586.xpi")
elif [ "$CARCH" = "x86_64" ]; then
    source=("http://www.go-mono.com/moonlight/downloads/3.99.0.3/novell-moonlight-3.99.0.3-x86_64.xpi")
fi

if [ "$CARCH" = "i686" ]; then
    _arch='i386'
    md5sums=('2f286c4b6988683df8e51dc3c9f7a180')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='x86_64'
    md5sums=('0653dfbbd488bcebccf0a906f08465c1')
fi

build() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/extensions/${emid}
  install -d $dstdir
  #sed -i 's#<em:maxVersion>.*</em:maxVersion>#<em:maxVersion>9.*</em:maxVersion>#' install.rdf
  rm *.xpi
  mv * $dstdir
}
