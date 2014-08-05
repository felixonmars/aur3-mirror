# Maintainer: Christoph Haag <haagch@studi.informatik.uni-stuttgart.de>
pkgname=wine-compholio-bin
pkgver=1.7.23
pkgrel=1
pkgdesc="special build of Wine. 32 Bit binary version from the PPA for Ubuntu 14.10. Should include same patches as wine-silverlight. Please use the official archlinux build instead of this."
arch=("i686" "x86_64")
url="https://launchpad.net/~ehoover/+archive/ubuntu/compholio/+packages?field.name_filter=wine-compholio&field.status_filter=published&field.series_filter=utopic"
license=('GPL')
groups=("pipelight-devel")
depends=("lib32-gstreamer0.10-base" "lib32-fontconfig" "lib32-libxcursor" "lib32-libxrandr" "lib32-libxdamage" "lib32-libxi" "lib32-gettext" "lib32-freetype2" "lib32-glu" "lib32-libsm" "lib32-gcc-libs")
[ "$CARCH" = 'i686' ] && depends=("gstreamer0.10-base" "fontconfig" "libxcursor" "libxrandr" "libxdamage" "libxi" "gettext" "freetype2" "glu" "libsm" "gcc-libs")
provides=("wine-silverlight" "wine-compholio")
options=()
conflicts=("wine-compholio")
_name="wine-compholio-${pkgver}.deb"
_name2="wine-compholio-${pkgver}2.deb"
                #https://launchpad.net/~ehoover/+archive/ubuntu/compholio/+files/wine-compholio-i386_1.7.23~ubuntu14.10.1_i386.deb
source=("$_name::https://launchpad.net/~ehoover/+archive/ubuntu/compholio/+files/wine-compholio-i386_${pkgver}~ubuntu14.10.1_i386.deb"
        "$_name2::https://launchpad.net/~ehoover/+archive/ubuntu/compholio/+files/wine-compholio_${pkgver}~ubuntu14.10.1_i386.deb")
#source=("$_name::https://launchpad.net/~ehoover/+archive/compholio/+files/wine-compholio_${pkgver}~ubuntu13.10.1_i386.deb")
noextract=("$_name2")

build() {
        cd "$srcdir/"
        bsdtar -xf data.tar.xz -C "$srcdir/"

        install -d wine1
        bsdtar -xf data.tar.xz -C "$srcdir/wine1/"

        ar x "$_name2"
        bsdtar -xf data.tar.xz -C "$srcdir/wine1/"
}

package() {
        mv "$srcdir/wine1/"* "$pkgdir"
#        mv "$srcdir/usr" "$pkgdir"
}

md5sums=('e80a73d6b18115ee3a2722ec282ccd45'
         '50d44e3d7fe297844913ce59c1dc59bd')
