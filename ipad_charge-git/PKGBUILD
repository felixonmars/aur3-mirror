# Maintainer: shtsh <anton.liparin AT  gmail DOT com>
pkgname=ipad_charge-git
pkgver=20120828
pkgrel=1
pkgdesc="iPad USB charging control utility. GIT version with additional devices"
arch=("i686" "x86_64")
url="https://github.com/mkorenkov/ipad_charge"
license=('GPL2')
#source=("http://www.rainbow-software.org/linux_files/${pkgname}_${pkgver}.tar.gz"
#"95-ipad_charge.rules.patch"
#"ipad_charge.c.patch"
#)
depends=('udev')
makedepends=('gcc' 'git')
conflicts=('ipad_charge')

_gitroot=https://github.com/mkorenkov/ipad_charge.git
_gitname=ipad_charge

build() {

  cd "${srcdir}"
        # Download or update the library
  msg "Connecting to GIT server over HTTP..."
  if [[ -d "${_gitname}" ]]; then
      (cd "${_gitname}" && git pull origin)
      msg "The local repository was updated."
  else
      git clone "${_gitroot}" "${_gitname}"
      msg "The remote repository was cloned."
  fi
  msg "GIT sync done, or server error (contact the maintainer)."

  cd $srcdir/${_gitname}
  msg `pwd`
  make
}

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/etc/udev/rules.d
  cd $srcdir/${_gitname}
  install -m755 -s ipad_charge $pkgdir/usr/bin/
  install -m644 95-ipad_charge.rules $pkgdir/etc/udev/rules.d/
}

# vim:set ts=2 sw=2 et:
