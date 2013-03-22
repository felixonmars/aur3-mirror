# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: Krzysztof Raczkowski <raczkow@gnu-tech.pl>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=xe-guest-utilities
pkgver=6.1.0
pkgrel=2
pkgdesc="Citrix XenServer Tools"
arch=('i686' 'x86_64')
url="http://citrix.com/English/ps2/products/product.asp?contentID=683148&ntref=hp_nav_US"
license=('GPL' 'LGPL')
optdepends=('linux: DomU kernel for x86_64'
	          'linux-xen: DomU kernel for i686'
	          'kernel-lts-xen: DomU kernel for i686 (long time supported)')
makedepends=('rpmextract')
source=("ftp://ftp.prz.edu.pl/pub/archlinux/aur/src/xe-guest-utilities-${pkgver}-1033.i386.rpm"
	      "ftp://ftp.prz.edu.pl/pub/archlinux/aur/src/xe-guest-utilities-xenstore-${pkgver}-1033.i386.rpm"
      	"ftp://ftp.prz.edu.pl/pub/archlinux/aur/src/xe-guest-utilities-${pkgver}-1033.x86_64.rpm"
      	"ftp://ftp.prz.edu.pl/pub/archlinux/aur/src/xe-guest-utilities-xenstore-${pkgver}-1033.x86_64.rpm"
      	'xe-linux-distribution.service'
      	'xe-guest-utilities-archlinux.patch'
      	'ip_address.patch')
md5sums=('843c491e48db32bd424dd266a8290eb4'
         'f469af962b30b03b36a089a5e764de7d'
         '751b8e383d46ed8229bd95ae799755ae'
         'c1efb36234bbeba21874ee532f69ad45'
         'c1a6b44c84676a36f552c6d65c6dba3e'
         'be02ae2fc5c803d7f30aec6529dc7df2'
         '7eb0741819c9620bc6218cba2c226996')

build() {
  cd "$srcdir"

  if [ $CARCH == "i686" ] ; then
    rpmextract.sh xe-guest-utilities-*.i386.rpm
    rpmextract.sh xe-guest-utilities-xenstore-*.i386.rpm
  elif [ $CARCH == "x86_64" ] ; then
    rpmextract.sh xe-guest-utilities-*.x86_64.rpm
    rpmextract.sh xe-guest-utilities-xenstore-*.x86_64.rpm
  fi

  patch -Np1 -i ${srcdir}/xe-guest-utilities-archlinux.patch
  patch -Np1 -i ${srcdir}/ip_address.patch
}

package() {
  cd "$srcdir"
  
  cp -ra {etc,usr} "${pkgdir}"/

  mv "${pkgdir}"/etc/init.d "${pkgdir}"/etc/rc.d

  # install systemd service file
  install -D xe-linux-distribution.service ${pkgdir}/usr/lib/systemd/system/xe-linux-distribution.service
}

# vim:set ts=2 sw=2 et:
