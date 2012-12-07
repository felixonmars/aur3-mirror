pkgname=tc-play-git
pkgver=20121207
pkgrel=1
pkgdesc="Free and simple TrueCrypt implementation based on dm-crypt."
arch=('i686' 'x86_64')
url="https://github.com/bwalex/tc-play"
license=('custom')
depends=('cryptsetup' 'libgcrypt' 'openssl')

_gitroot="git://github.com/bwalex/tc-play.git"
_gitname="tc-play"


build() {
  cd "$srcdir"

  if [ -d "$srcdir/$_gitname" ] ; then
    cd "$_gitname" && git pull origin
   else
    git clone "$_gitroot"
    cd "$_tigname"
  fi

  mkdir -p "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"
  cp -Rut . "${srcdir}/${_gitname}"/*
  make
}

package() {
  cd "${srcdir}/${_gitname}-build"
#   make DESTDIR="${pkgdir}" install
  install -Dm755 tcplay "$pkgdir"/usr/bin/tcplay
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/tc-play/LICENSE
}
