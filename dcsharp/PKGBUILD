# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Lucas Correia <lucaaas@gmail.com>
# Maintainer: Nathan Owe <ndowens.aur at gmail.com>
pkgname=dcsharp
pkgver=0.11.1
pkgrel=4
pkgdesc="A file sharing client for the Direct Connect protocol"
arch=('i686' 'x86_64')
url="http://dcsharp.googlecode.com/"
license=('GPL')
depends=('sh')
makedepends=('scons')
source=("http://dcsharp.googlecode.com/files/${pkgname}-${pkgver}.tar.bz2" "fixes.diff" "trayicon.patch" "${pkgname}.desktop")
md5sums=('774aa9968acb3093e0139b0986129eba'
         '144d385e88f7f77b0fb774b32d936e73'
         'c9cd4d6100feb15168f69986370478f7'
         '5aacd4829e27296a879a99f225204fa3')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -Np0 -i ../fixes.diff 
  patch -Np0 -i ../trayicon.patch 
  scons GNOME=false 
}
package() {
	install -d ${pkgdir}/usr/share/applications
	cd ${srcdir}/${pkgname}-${pkgver}
  scons DESTDIR=${pkgdir} install
  install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
