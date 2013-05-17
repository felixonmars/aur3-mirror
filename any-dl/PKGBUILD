# Maintainer: oliver < a t >  first . in-berlin . de

pkgname=any-dl
pkgver=0.9.6.b
pkgrel=3
pkgdesc="Generic video downloader for principially any site."
arch=('i686' 'x86_64')
license=('GPL3')
source=(http://www.first.in-berlin.de/software/tools/any-dl/any-dl-0.9.6.b.tgz)
md5sums=('8c84dce7c000af0233ced746b64becbc')
url="http://www.first.in-berlin.de/software/tools/any-dl/"
depends=('ocaml' 'ocaml-pcre' 'ocaml-xml-light' 'ocamlnet' 'ocaml-curl')
makedepends=('ocaml-findlib')
options=(!makeflags)

build() {
cd ${srcdir}/${pkgname}-${pkgver}
make
echo Please be aware, that your file $HOME/any-dl.rc will be overwritten too.
}


package() {
cd ${srcdir}/${pkgname}-${pkgver}

install -Dm 755 any-dl ${pkgdir}/usr/bin/any-dl         # install to Arch-Linux path

[ -f $HOME/.any-dl.rc  ] && cp -avf $HOME/.any-dl.rc $HOME/.any-dl.rc.bak           # backup of your any-dl-rc-file
install -Dm 644 rc-file.adl ${pkgdir}$HOME/.any-dl.rc   # new any-dl-rc-file
}
