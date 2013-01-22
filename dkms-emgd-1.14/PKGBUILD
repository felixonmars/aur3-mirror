# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=dkms-emgd-1.14
_pkgname=dkms-emgd
_modname=emgd
_modpackage=emgd-dkms
pkgver=1.14.0.2443
_ubustring=0ubuntu2~ppa1
pkgrel=5
pkgdesc="Intel EMGD driver in DKMS format."
arch=('i686')
url="http://edc.intel.com/Software/Downloads/EMGD/"
license=('GPL')
depends=('dkms' 'xorg-server')
makedepends=('make' 'bash' 'patch')
provides=('emgd')
install="${_pkgname}.install"

source=(http://ppa.launchpad.net/jools/emgd-xorg1.9/ubuntu/pool/main/e/emgd-dkms/"${_modpackage}"_"${pkgver}"-"${_ubustring}".tar.gz
        ${_pkgname}.install
        dkms.conf
    	emgd-3.3-fix.patch
    	emgd-3.6-fix.patch)
md5sums=('e711beaae3b9ceb427cae45463a7afcc'
         'bc16555f615d8e1e01601ac78f66c03c'
         '69f4bd5ae0bd184542b4545c00b77216'
	     'c7b30b4147fc93130c2677f314114285'
         'b7ceda1eeadf3e7e803e1710a5c87fda')

build() {
    # Messages
    warning "This Driver NEED using Xorg 1.9."
    echo
    echo '
    Please, edit your /etc/pacman.conf and add:

    [xorg19]
    Server = http://catalyst.apocalypsus.net/repo/xorg19/$arch

    Downgrade all your xorg with packages in Xorg19 repo
    (if need older dependencies, try "http://arm.konnichi.com/extra/os/i686/" 
     
        
    and add to "IgnoreGroup" secction:

    IgnoreGroup = xorg

    to prevent possible upgrade
'
    read -p "If you apply this, please continue, if not, cancel this installation [y/N] " -n 1
      if [[ ! $REPLY =~ ^[Yy]$ ]]; then
	echo
	return 1
      fi
      echo

    cd "${srcdir}/emgd-dkms-${pkgver}"
    patch -p1 -i "${srcdir}/emgd-3.3-fix.patch"
    patch -p0 -i "${srcdir}/emgd-3.6-fix.patch"
}

package() {
    install -d "${pkgdir}"/usr/src/"${_modname}"-"${pkgver}"/
    cp -R "${srcdir}"/emgd-dkms-${pkgver}/* "${pkgdir}"/usr/src/"${_modname}"-"${pkgver}"/
    install -Dm644 "${srcdir}"/dkms.conf "${pkgdir}"/usr/src/"${_modname}"-"${pkgver}"/
    install -Dm755 "${srcdir}"/emgd-dkms-${pkgver}/COPYING "${pkgdir}"/usr/share/licenses/"${_pkgname}"/COPYING
    rm -fr "${pkgdir}"/usr/src/"${_modname}"-"${pkgver}"/debian
}
