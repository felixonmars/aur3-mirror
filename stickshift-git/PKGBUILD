# Creator: Cristóvão Duarte Sousa <crisjss@gmail.com>
pkgname=stickshift-git
pkgver=20120106
pkgrel=1
pkgdesc="Create 'shift' buttons on your Linux Joystick"
arch=('i686' 'x86_64')
url="https://github.com/petechap/stickshift"
license=('GPL2')
groups=()
depends=('boost-libs' 'libxml2' 'fuse')
makedepends=('git' 'boost')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=https://github.com/petechap/stickshift.git
_gitname=stickshift

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

   cd "$srcdir/$_gitname"
   make
}

package() {   
  install -d -m755 ${pkgdir}/usr/bin
  install -D -m755 ${srcdir}/${_gitname}/stickshift ${pkgdir}/usr/bin/
  
  
  install -d -m755 ${pkgdir}/usr/share/doc/${_gitname}/examples
  install -D -m644 ${srcdir}/${_gitname}/README.txt ${pkgdir}/usr/share/doc/${_gitname}
  install -D -m644 ${srcdir}/${_gitname}/x52pro.xml ${pkgdir}/usr/share/doc/${_gitname}/examples
  
  install -d -m755 ${pkgdir}/etc/udev/rules.d
  install -m644 ${srcdir}/${_gitname}/10-stickshift-xplane.rules ${pkgdir}/etc/udev/rules.d/10-stickshift.rules
}

# vim:set ts=2 sw=2 et:
