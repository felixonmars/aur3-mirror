# Maintainer: Daniel <packages@post.danielnoegel.de>

pkgname=lib32-libsmpeg
pkgver=0_0.4.5
_pkgrel32=1ubuntu1
pkgrel=1
url='http://security.ubuntu.com/ubuntu/pool/main/s/smpeg/'
pkgdesc="A package that installs libsmpeg-0.4.so"
arch=('x86_64')
license=("LGPL")
groups=('lib32')
#depends=('lib32-zlib' 'lib32-libjpeg6')
makedepends=(deb2targz)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
_cvs_ver="+cvs20030824-2.2"
source=("http://security.ubuntu.com/ubuntu/pool/main/s/smpeg/libsmpeg${pkgver}${_cvs_ver}_i386.deb")
noextract=()
md5sums=('55c34db57379116921877f22f79172a9')

build() {

  deb2targz libsmpeg${pkgver}${_cvs_ver}_i386.deb
  tar -xvvf libsmpeg${pkgver}${_cvs_ver}_i386.tar.gz
  mkdir -p ${pkgdir}/usr/lib32
  cp -R ${srcdir}/usr/lib/* ${pkgdir}/usr/lib32/

}
