
# Maintainer: jellysheep <max.mail@dameweb.de> 

pkgname=fedora-chroot
pkgver=20
pkgrel=2
pkgdesc="Fedora chroot environment."
url="https://fedoraproject.org/"
arch=('i686' 'x86_64')
license=('BSD-3')
depends=('rpm-org' 'yum')
makedepends=()
options=()
noextract=("fedora-release-${pkgver}-1.noarch.rpm")
install=fedora-chroot.install

source=("fedora-release-${pkgver}-1.noarch.rpm"
        "fedora-chroot.install"
        "fedora-chroot.sh"
        "install.sh"
        "resolv.conf")
md5sums=('256da421a8e6ba746e98d2ebf3075d73'
         '5eafe640bb9408e80862479e444f9cc8'
         '2bc7030814a61fe88859d4a0662128d3'
         '2c328e68cc45930286dbd9691dd60032'
         '765cb4c612f8a2678727dfd3f127a325')

[ "$CARCH" == "i686" ] && {
	source[0]="http://download.fedoraproject.org/pub/fedora/linux/releases/20/Everything/i386/os/Packages/f/fedora-release-${pkgver}-1.noarch.rpm"
	md5sums[0]="256da421a8e6ba746e98d2ebf3075d73"
}
[ "$CARCH" == "x86_64" ] && {
	source[0]="http://download.fedoraproject.org/pub/fedora/linux/releases/20/Everything/x86_64/os/Packages/f/fedora-release-${pkgver}-1.noarch.rpm"
	md5sums[0]="256da421a8e6ba746e98d2ebf3075d73"
}

# Define the directory where the Fedora chroot should be installed
_install_root="/opt/${pkgname}"

# Define the user names that should be configured in the chroot, or leave empty, e.g.
# _users="user foo bar"
_users="user"

# Define the packages that should be installed in addition to yum, or leave empty, e.g.
# _packages="sudo git mingw32-qt5-qtbase mingw32-eigen3 cmake make wine.i686"
_packages=""

build()
{
	mkdir -p "${srcdir}/modified"
	cp "${srcdir}/"{fedora-chroot.sh,install.sh} "${srcdir}/modified/"
	sed -i -e "s\\\${ROOT}\\${_install_root}\\g" "${srcdir}/modified/fedora-chroot.sh"
	sed -i -e "s\\\${FEDORA_RELEASE_RPM}\\fedora-release-${pkgver}-1.noarch.rpm\\g" "${srcdir}/modified/fedora-chroot.sh"
	sed -i -e "s\\\${PACKAGES}\\yum ${_packages}\\g" "${srcdir}/modified/fedora-chroot.sh"
	for user in $_users; do
		echo "/usr/sbin/useradd -m -g users '$user'" >> "${srcdir}/modified/install.sh"
	done
}

package()
{
	mkdir -p "${pkgdir}${_install_root}/"{usr/bin,etc}
	cp "${srcdir}/fedora-release-${pkgver}-1.noarch.rpm" "${pkgdir}${_install_root}/fedora-release-${pkgver}-1.noarch.rpm"
	cp "${srcdir}/resolv.conf" "${pkgdir}${_install_root}/etc/resolv.conf"
	cp "${srcdir}/modified/install.sh" "${pkgdir}${_install_root}/usr/bin/install.sh"
	chmod +x "${pkgdir}${_install_root}/usr/bin/install.sh"
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/modified/fedora-chroot.sh" "${pkgdir}/usr/bin/"
	chmod +x "${pkgdir}/usr/bin/fedora-chroot.sh"
}
