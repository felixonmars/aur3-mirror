pkgname=binary2shellcode-git
pkgver=20120319
pkgrel=1
pkgdesc="Converter binary to shellcode and gets the size of shellcode in bytes.    "
url="https://github.com/Hamza-Megahed/binary2shellcode"
arch=('any')
license=('GNU')
options=(zipman)
makedepends=('git')

_gitroot="git://github.com/Hamza-Megahed/binary2shellcode.git"
_gitname="binary2shellcode"
_gitbranch="master"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."
  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname} -b ${_gitbranch}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/Debug"

  make

}

package() {
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -m644 -D README $pkgdir/usr/share/doc/$pkgname/README
}

