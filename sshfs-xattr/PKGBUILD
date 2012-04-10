# $Id: PKGBUILD 154283 2012-03-25 10:23:17Z giovanni $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Wolfgang Bumiller <fc2.oyho@fcrrq.ng> (rot13 encoded)

pkgname=sshfs-xattr
_pkgname=sshfs
pkgver=2.4
pkgrel=1
pkgdesc="FUSE client based on the SSH File Transfer Protocol capable of using the xattr support of openssh-xattr"
arch=('i686' 'x86_64')
url="http://fuse.sourceforge.net/sshfs.html"
license=('GPL')
depends=('fuse' 'glib2' 'openssh')
makedepends=('pkg-config')
provides=("$_pkgname=$pkgver-$pkgrel")
conflicts=("$_pkgname")
source=("http://downloads.sourceforge.net/sourceforge/fuse/${_pkgname}-fuse-${pkgver}.tar.gz"
	sshfs-xattr.patch)
md5sums=('3c7c3647c52ce84d09486f1da3a3ce24'
         'acddea134815527ebcb6f28e911386f4')

build() {
  cd "${srcdir}/${_pkgname}-fuse-${pkgver}"

  patch -Np1 -i "$srcdir/sshfs-xattr.patch"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-fuse-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
