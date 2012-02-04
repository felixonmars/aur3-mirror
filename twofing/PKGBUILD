# Contributors: Evilandi666 <evilandi.aur(at)googlemail.com>

pkgname=twofing
pkgver=20120121
pkgrel=1
pkgdesc="twofing is a daemon which runs in the background and recognizes two-finger gestures performed on a touchscreen and converts them into mouse and keyboard events. This is the edition with patched udev rules for the WeTab/ExoPC."
arch=('i686' 'x86_64')
url="https://github.com/plippo/twofing"
depends=('udev' 'libxtst' 'libxrandr' 'udev')
makedepends=('sed' 'libxi' 'inputproto')
options=()
license=('custom')
_gitroot='git://github.com/Plippo/twofing.git'
_gitname='twofing'

build() {
  cd "${srcdir}"
  msg "Connecting to git://github.com/Plippo/twofing.git ...."
  if [ -d ${srcdir}/$_gitname ] ; then
     cd $_gitname && git pull origin
     msg "The local files are updated."
  else
     git clone $_gitroot
     cd $_gitname
  fi
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/etc/udev/rules.d/
  make || return 1
  make install DESTDIR=$pkgdir || return 1
}
package() {
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cat "${srcdir}/${_gitname}/twofingemu.c" | head -n 15 > "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
