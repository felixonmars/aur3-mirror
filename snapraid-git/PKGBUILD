# Maintainer: Scott Dose <sdose27 at gmail dot com>

pkgname=snapraid-git
_gitname=snapraid
pkgver=v8.0.r0.g2c4321d
pkgrel=2
pkgdesc="Latest snapRAID git commit"
url="http://snapraid.sourceforge.net/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('glibc')
optdepends=('smartmontools: SMART Support')
makedepends=('git' 'autoconf')
conflicts=('snapraid')
install='snapraid.install'
source=("git+https://github.com/amadvance/snapraid"
        "snapraid.install")
md5sums=('SKIP'
         '22c5da76c6b7e41e38b8a31d42bc2264')

pkgver() {
   cd ${_gitname}
   git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' 
}

build() {
   cd ${_gitname}
   
   # Generate config file
   ./autogen.sh || return 1

   ./configure --prefix=/usr || return 1
   make || return 1
}

check() {
   cd "${srcdir}/${_gitname}"
   make check || return 1
}

package() {
   cd ${_gitname}
 
   make DESTDIR="${pkgdir}/" prefix="/usr" mandir="/usr/share/man" install || return 1
 
   install -D -m 644 snapraid.conf.example ${pkgdir}/usr/share/${_gitname}/snapraid.conf.example
    
   install -D -m 644 AUTHORS ${pkgdir}/usr/share/doc/${_gitname}/AUTHORS
   install -D -m 644 CHECK   ${pkgdir}/usr/share/doc/${_gitname}/CHECK
   install -D -m 644 COPYING ${pkgdir}/usr/share/doc/${_gitname}/COPYING 
   install -D -m 644 HISTORY ${pkgdir}/usr/share/doc/${_gitname}/HISTORY 
   install -D -m 644 INSTALL ${pkgdir}/usr/share/doc/${_gitname}/INSTALL
   install -D -m 644 README  ${pkgdir}/usr/share/doc/${_gitname}/README
   install -D -m 644 TODO    ${pkgdir}/usr/share/doc/${_gitname}/TODO
}
