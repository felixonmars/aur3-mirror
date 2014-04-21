pkgname=boot-git
pkgver=20140312
pkgrel=1
pkgdesc="A Clojure build tool"
arch=(i686 x86_64)
url="http://github.com/tailrecursion/boot"
license=("EPL")
depends=('java-environment' 'clojure' 'leiningen')
makedepends=('git' 'make')
provides=('boot')

_gitroot=git://github.com/tailrecursion/boot.git
_gitname=boot

build() {
  cd ${srcdir}

  msg "Connecting to GIT server..."
  if [ -d ${_gitname} ]; then
    cd ${_gitname} 
    git pull origin
    msg "Updated local files."
  else
    git clone ${_gitroot}
    msg "Cloned remote repository."
  fi

  cd ${_gitname}
  make ${pkgname/-git/}
}
package() {
  install -D ${srcdir}/${_gitname}/${pkgname/-git/} ${pkgdir}/usr/bin/${pkgname/-git/}
}
