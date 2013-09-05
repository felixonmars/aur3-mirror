# Maintainer: Jason Kölker <jason@koelker.net>
pkgbase=devcoin-git
pkgname=('devcoin-daemon-git')
pkgver=20130904
pkgrel=1
pkgdesc='Devcoin distributed currency based on bitcoin'
arch=('i686' 'x86_64')
url='http://www.devtome.com/doku.php?id=devcoin'
license=('MIT')
makedepends=('git' 'make' 'gcc' 'boost' 'boost-libs' 'wxgtk')
provides=('devcoin-daemon')
md5sums=(SKIP)

_gitroot=git://gitorious.org/devcoin/devcoin.git
_gitname=devcoin


build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"

  msg "Starting build..."

  cd ${srcdir}/${_gitname}/src

  msg "Fixing static boost usage"
  sed -i '17s|Bstatic|Bdynamic|' makefile.unix

  # TODO(jkoelker) fix gui compile for wxgtk
  #make -f makefile.unix devcoin

  make -f makefile.unix devcoind
}

package_devcoin-daemon-git() {
  depends=('boost-libs' 'openssl' 'miniupnpc' 'mpfr')
  cd ${srcdir}/${_gitname}

  install -Dm0755 src/devcoind ${pkgdir}/usr/bin/devcoind
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
