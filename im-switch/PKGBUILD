# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=im-switch
pkgver=1.22
pkgrel=1
pkgdesc="Input method switch framework"
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/im-switch"
license=('GPL')
depends=()
makedepends=()
optdepends=('zenity: GUI for im-switch')
source=("http://ftp.de.debian.org/debian/pool/main/i/im-switch/im-switch_${pkgver}.tar.gz")
sha512sums=('0d921da6d16889b14d4b19687673ec33bdf76ab3027fe4eb373dc4296b2a9b3cdb7374eba89e8ee6dfb504b00ce0ff9d5bfe36dce8d8b96ad3c2fefe7c6c0186')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  #Disable dependency support as Ubuntu/Debian package names are different
  #  from Arch Linux package names and other packages need to be patched to
  #  change those dependencies. Also, dpkg doesn't work on Arch Linux.
  sed -i -e '/^dependency().*$/ a #dpkg is only for Ubuntu/Debian, not Arch Linux\nreturn' im-switch.in
  #Disable information message that tells the user to read a Debian only
  #  documentation file.
  sed -i -e 's/Please.*README.Debian.gz.*\$/$/g' im-switch.in
  sed -i -e 's/Please.*README.Debian.gz//g' im-switch.in
  #Remove some other Debian specific stuff
  sed -i -e 's/using\ Debian.*mechanism.//g' im-switch.in
  #Disable setting system IM, which requires dpkg's update-alternatives
  sed -i -e '/When.*root/d' im-switch.in
  sed -i -e '/#!/ a if [ $(id -u) == 0 ]; then echo "Running as root disabled. Setting the system IM only works under Debian/Ubuntu."; exit 1; fi' im-switch.in
  sed -i -e 's/User choice.*default.//g' im-switch.in

  sed -e "s/@@VERSION@@/${pkgver}/" <im-switch.in >im-switch
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  msg "Nothing to check."
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/usr/share/applications/"
  install -dm755 "${pkgdir}/etc/X11/xinit/xinitrc.d/"
  install -dm755 "${pkgdir}/etc/X11/xinit/xinput.d/"
  install -m755 'im-switch' "${pkgdir}/usr/bin/"
  install -m644 'im-switch.desktop' "${pkgdir}/usr/share/applications/"
  install -m755 '80im-switch' "${pkgdir}/etc/X11/xinit/xinitrc.d/"
  for i in xinput.d/*; do
    install -m644 "${i}" "${pkgdir}/etc/X11/xinit/xinput.d/"
  done
}

# vim:set ts=2 sw=2 et:
