# Contributor: Kyro <chris-bos-lee@hotmail.com>
# Maintainer: Otto Meier <otto@kesselgulasch.org>
# Original-Maintainer: Bernd Zeimetz <bzed@debian.org>

pkgname=gimp-plugin-registry
pkgver=5.20121030
pkgrel=2
debrel=saucy8~ppa
debrepo=https://launchpad.net/~otto-kesselgulasch/+archive/gimp/+files
pkgdesc="Plug-in Set for GIMP 2.8.x."
arch=('i686' 'x86_64')
url="https://launchpad.net/~otto-kesselgulasch/+archive/gimp/+sourcepub/2763050/+listing-archive-extra"
license=('GPL')
depends=('gimp' 'gtk2')
#depends=('gimp' 'gtk2' 'gtkglext' 'glew')

install=${pkgname}.install

 if [ "$CARCH" = "x86_64" ]; then
    _debarch=amd64
    sha256sums=('1ef17189b8ed392e175c2bed7bb9dc230171882c9318984807cd911a80b14a02')
else
    _debarch=i386
    sha256sums=('16df01e1ab5e76f711c940cd88be4a3c007da523651960a7c37186ef03a02bc2')
 fi

source=("${debrepo}/${pkgname}_${pkgver}-${pkgrel}${debrel}_${_debarch}.deb")

package() {
      msg2 "Installing "$pkgname"..."
      tar xzvf data.tar.gz -C "${pkgdir}"/
      
      msg2 "Cleaning up unwanted files..."
      rm -rv "${pkgdir}"/usr/lib/gimp/2.0/plug-ins/normalmap
}
# vim:set ts=2 sw=2 et: