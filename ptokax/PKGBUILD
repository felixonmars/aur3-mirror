# Maintainer: Alexandr Boyko <brdcom@ya.ru>
# Contributor: Semitsoglou-Tsiapos Dimitrios <madcatmk254 [at] gmail [dot] com>


pkgname=ptokax
pkgver=0.4.2.0
pkgrel=2
pkgdesc="A Direct Connect Hub Peer-To-Peer sharing network. "
arch=('i686' 'x86_64')
url="http://www.ptokax.org"
license=('GPL3')
depends=('zlib' 'lua' 'luasocket' 'lua-zlib' 'tinyxml')
optdepends=('luasql-mysql' 'luapozix' 'luafilesystem' 'mysql')
install=ptokax.install
source=(http://www.czdc.org/PtokaX/${pkgver}-nix-src.tgz
        http://downloads.sourceforge.net/project/tinyxml/tinyxml/2.6.1/tinyxml_2_6_1.tar.gz
	ptokax
	ptokax.default
        ptokax.patch
        ptokax64.patch)
md5sums=('a5ed67abb7e7f9ba6a158d7779eae17f'
         'adb56a2a5cceb53141c5fb67f53a096d'
         '4e1eabaa32fa23111f019c32d5b2f3f1'
         '47e579123c297019c96b67d116e242fa'
         'c9c66bada575022e633fee8892a85b9c'
         '2ee96c94d4450045c074e39edbc263fe')

build() {
#copy and patch tinyxml files
  cp -rn "${srcdir}"/tinyxml "${srcdir}"/PtokaX

#make local tinyxml
  cd "${srcdir}"/PtokaX/tinyxml
  make

#patch makefile of ptokax
cd "${srcdir}"/PtokaX

if [ $CARCH = 'i686' ] ;
then
  cp "${srcdir}"/ptokax.patch "${srcdir}"/PtokaX
  patch -i ptokax.patch
else
  cp "${srcdir}"/ptokax64.patch "${srcdir}"/PtokaX
  patch -i ptokax64.patch
fi

#make ptokax
  cd "${srcdir}"/PtokaX
  make
}

package() {
  cd "${srcdir}"/PtokaX

  install -d "${pkgdir}"/opt/ptokax/{cfg.example,language,ico,logs}/
  install -Dm644 cfg.example/* "${pkgdir}"/opt/ptokax/cfg.example/
  install -Dm644 language/* "${pkgdir}"/opt/ptokax/language
  install -Dm644 ico/* "${pkgdir}"/opt/ptokax/ico

  install -d "${pkgdir}"/usr/share/doc/ptokax/scripting.docs/scripting-interface.html
  install -Dm644 scripting.docs/scripting-interface.html/* "${pkgdir}"/usr/share/doc/ptokax/scripting.docs/scripting-interface.html
  install -Dm644 scripting.docs/scripting-interface.txt "${pkgdir}"/usr/share/doc/ptokax/scripting.docs/
  install -Dm644 *.txt "${pkgdir}"/usr/share/doc/ptokax/

  install -d "${pkgdir}"{/usr/bin,/etc/conf.d,/etc/rc.d}
  install -Dm755 PtokaX "${pkgdir}"/opt/ptokax/
  install -Dm755 "${srcdir}"/ptokax "${pkgdir}"/etc/rc.d/ptokax
  install -Dm644 "${srcdir}"/ptokax.default "${pkgdir}"/etc/conf.d/ptokax
  ln -sv /opt/ptokax/PtokaX "${pkgdir}"/usr/bin/ptokax
  ln -sv /var/log/ptokax.log "${pkgdir}/opt/ptokax/logs/system.log"
}
