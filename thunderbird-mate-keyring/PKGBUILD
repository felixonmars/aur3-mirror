# Maintainer: lepokle <devel@leo.von-klenze.de>
pkgname='thunderbird-mate-keyring'
pkgver=0.9
pkgrel=1
pkgdesc="Gnome-keyring integration for Thunderbird"
arch=('i686' 'x86_64')
url='http://github.com/lepokle/firefox-gnome-keyring'
license=('GPL')
depends=('thunderbird>=17.0' 'mate-keyring')
makedepends=('zip' 'unzip' 'xulrunner>=17.0')
source=("${pkgname}-v${pkgver}-${pkgrel}.tar.gz::$url/tarball/v${pkgver}-${pkgrel}")
md5sums=('641414618c082f3e6cd514a301cd6a50')
conflicts=('thunderbird-gnome-keyring')

_subdir="lepokle-firefox-gnome-keyring-061888c"

build()
{
	cd ${srcdir}/${_subdir}
	msg "Building extension..."
   sed -i -e 's:GNOME:MATE:g' \
          -e 's:Gnome:Mate:g' \
          -e 's:gnome:mate:g' *
   for _file in Gnome* ; do mv "$_file" "${_file/Gnome/Mate}" ; done
	make
}

package()
{
	cd ${srcdir}

	mkdir -p ${pkgdir}/usr/lib/thunderbird/extensions
	unzip ${srcdir}/${_subdir}/mozilla-mate-keyring-*.xpi -d ${pkgdir}/usr/lib/thunderbird/extensions/{6f9d85e0-794d-11dd-ad8b-0800200c9a66}
}

