# Maintainer: Igor Mosyagin <c6h10o5@gmail.com>

pkgname=xmlsec-gost-git
pkgver=20111018
pkgrel=1
pkgdesc="XMLSEC git version with GOST algorithms enabled"
arch=(i686 x86_64)
url="http://www.aleksey.com/xmlsec/index.html"
license=('custom')
depends=('libxslt>=1.1.26' 'openssl>=1.0.0' 'gnutls' 'nss>=3.12.10' 'libtool')
makedepends=('git')
options=('!libtool')
provides=('xmlsec')
conflicts=('xmlsec')

_gitroot=git://git.gnome.org/${pkgname/-*}
_gitname=${pkgname/-*}

build() {

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d "$_gitname" ] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --depth 1 "$_gitroot"
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr --disable-static --enable-gost
  make

}

check() {
  cd "$srcdir/$_gitname"
  make -k check
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="${pkgdir}/" install
  install -m755 -d ${pkgdir}/usr/share/licenses/${_basepkgname}
  install -m644 COPYING ${pkgdir}/usr/share/licenses/${_basepkgname}/
}

# vim:set ts=2 sw=2 et:
