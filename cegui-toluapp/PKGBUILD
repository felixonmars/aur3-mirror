#Contributor:	Sven-Hendrik Haase	<lutzhaase.com:	sh>
#Contributor:	Juergen Hoetzel		<archlinux.org:	juergen>
#Contributor:	William Rea		<gmail.com:	sillywilly>
#Contributor:	Bjorn Lindeijer		<lindeijer.nl:	bjorn>
#Maintainer:	Jesse Jaara		<gmail.com:	jesse.jaara>

pkgname=cegui-toluapp
pkgver=0.7.9
pkgrel=1
pkgdesc="A free library providing windowing and widgets for graphics APIs/engines"
arch=('i686' 'x86_64')
url="http://crayzedsgui.sourceforge.net"
license=("MIT")
depends=('glew' 'freetype2' 'libxml2' 'devil' 'lua' 'silly' 'mesa')
makedepends=('python2' 'doxygen' 'ogre'  'gtk2' 'boost' 'graphviz' 'irrlicht' 'toluapp')
optdepends=("python2: python bindings"
            "ogre: ogre module"
            "gtk2: gtk2 module"
            "irrlicht: irrlicht module")
conflicts=('cegui' 'cegui-0.7')
provides=('cegui-0.7')
options=(!libtool)
source=(http://downloads.sourceforge.net/crayzedsgui/CEGUI-${pkgver}.tar.gz)

build() {
  cd "${srcdir}/CEGUI-${pkgver}"

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --enable-null-renderer \
    --with-gtk2

  make
}

package() {
  cd "${srcdir}/CEGUI-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 doc/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('a8b682daf82e383edc169c2e6eb2b321')
