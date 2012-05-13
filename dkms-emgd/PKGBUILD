# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=dkms-emgd
_modname=emgd
_modpackage=emgd-dkms
pkgver=1.10.0.2209
_ubustring=0ubuntu1~ppa2
pkgrel=5
pkgdesc="Intel EMGD driver in DKMS format."
arch=('i686')
url="http://edc.intel.com/Software/Downloads/EMGD/"
license=('GPL')
depends=('dkms' 'xorg-server=1.10.4')
makedepends=('make' 'bash' 'patch')
provides=('emgd')
install="dkms-emgd.install"

source=(https://launchpad.net/~gma500/+archive/emgd110/+files/"${_modpackage}"_"${pkgver}"-"${_ubustring}".tar.gz
        ${pkgname}.install
        dkms.conf
	emgd-3.3-fix.patch)
md5sums=('210b6afe2cda59b928a206bb474a6a29'
         'df8d97ca748c17c97ab52ecbc2b122f8'
         '42a84d3197c2ae70ab6b90640ad4b5dc'
	 '0f4ee176507690424fdcc2d506f35cca')

build() {
    # Messages
    warning "This Driver NEED using Xorg 1.10."
    echo
    echo '
    Please, edit your /etc/pacman.conf and add:

    [xorg110]
    Server = http://catalyst.apocalypsus.net/repo/xorg110/$arch

    Downgrade all your xorg with packages in Xorg110 repo
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

    cd "${srcdir}/emgd-dkms"
    patch -p1 -i "${srcdir}/emgd-3.3-fix.patch"
}

package() {
    install -d "${pkgdir}"/usr/src/"${_modname}"-"${pkgver}"/
    cp -R "${srcdir}"/emgd-dkms/* "${pkgdir}"/usr/src/"${_modname}"-"${pkgver}"/
    install -Dm644 "${srcdir}"/dkms.conf "${pkgdir}"/usr/src/"${_modname}"-"${pkgver}"/
    install -Dm755 "${srcdir}"/emgd-dkms/COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING
    rm -fr "${pkgdir}"/usr/src/"${_modname}"-"${pkgver}"/debian
}
