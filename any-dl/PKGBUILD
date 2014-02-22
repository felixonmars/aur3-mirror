# Maintainer: oliver < a t >  first . in-berlin . de

pkgname=any-dl
pkgver=0.9.10
pkgrel=1
pkgdesc="Generic video downloader for principially any site."
arch=('i686' 'x86_64')
license=('GPL3')
source=(http://www.first.in-berlin.de/software/tools/any-dl/any-dl-0.9.10.tgz)
md5sums=('9994664c0404c368c602ad1ad47307a0')
url="http://www.first.in-berlin.de/software/tools/any-dl/"
depends=('ocaml' 'ocaml-pcre' 'ocaml-xml-light' 'ocamlnet' 'ocaml-curl')
makedepends=('ocaml-findlib')
options=(!makeflags)

build() {
cd ${srcdir}/${pkgname}-${pkgver}
make
echo .
echo !!! From version 0.9.8, the provided config-file will be stored in /etc/ directory.
echo !!! You can and should remove the old $HOME/any-dl.rc file.
echo !!! Alternatively, you can use that file for your own scripts.
echo !!! But\$XDG_CONFIG_HOME/any-dl.rc is preferred. 
echo .
}


package() {
cd ${srcdir}/${pkgname}-${pkgver}

install -Dm 755 any-dl ${pkgdir}/usr/bin/any-dl      # install binary to Arch-Linux path
install -Dm 644 rc-file.adl ${pkgdir}/etc/any-dl.rc  # install config-file to /etc/
}
