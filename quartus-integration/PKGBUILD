# Maintainer: Matthias Blaicher <matthias at blaicher dot com>
#
# NOTE: To build this package you need to place the Altera Quartus installer into your startdir.
#       If you plan on using the usbblaster make sure you are member of the plugdev group.
pkgname=quartus-integration
pkgver=1
pkgrel=1
pkgdesc="Quartus II system integration files for archlinux"
arch=('i686' 'x86_64')
url="http://www.altera.com/products/software/quartus-ii/"
license=('GPL')

_alteradir="/opt/altera"

#In case you are using quartus ii subscription edition
_alteralicense="${_alteradir}/License.dat"

# According to the installer script, these dependencies are needed for the installer
				  
source=("quartus.sh" "quartus.desktop" "51-usbblaster.rules")
options=('!strip')

package() {
    cd "${srcdir}"

    #ENV variables
    sed -i.bak "s,_alteradir,$_alteradir,g" quartus.sh
    sed -i.bak "s,_alteralicense,${_alteralicense},g" quartus.sh
    [[ $CARCH = x86_64 ]] && echo "export QUARTUS_64BIT=1" >> quartus.sh

    install -D -m644 quartus.sh "${pkgdir}/etc/profile.d/quartus.sh"
    install -D -m644 51-usbblaster.rules "${pkgdir}/usr/lib/udev/rules.d/51-usbblaster.rules"
    install -D -m644 quartus.desktop "${pkgdir}/usr/share/applications/quartus.desktop"
}

# vim:set ts=2 sw=2 et:
md5sums=('91abd8bfa69dbe678ea8d8927af98712'
         'a1984f06442d98b0c433ea923a11725b'
         '3d448098eda1515e503ed9dcac7b64a5')
