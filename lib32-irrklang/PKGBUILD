# Maintainer: John Schroeder <jschroed@gmail.com>
# Contributor: Dan Vratil <vratil@progdansoft.com>

pkgname=lib32-irrklang
pkgver=1.4.0b
_folderver=1.4.0
pkgrel=1
pkgdesc="3D audio library (32 bit)"
arch=('x86_64')
url="http://www.ambiera.com/irrklang"
license=('custom')
groups=('lib32')
makedepends=('unzip')
options=(!strip)
source=(http://www.ambiera.at/downloads/irrKlang-${pkgver}.zip
        irrKlang.pc LICENSE)
md5sums=('23207eddb0b7e05becb91d847b92757e'
         'f2d3e748bcc9e67a1462a322e60ea7ce'
         '98cdbeb0ccbc5d9b9ba2fce7ba49eb92')

package() 
{
  install -Dm755 ${srcdir}/irrKlang-${_folderver}/bin/linux-gcc/ikpMP3.so ${pkgdir}/usr/lib32/ikpMP3.so
  install -Dm755 ${srcdir}/irrKlang-${_folderver}/bin/linux-gcc/libIrrKlang.so ${pkgdir}/usr/lib32/libIrrKlang.so

  install -dm644 ${pkgdir}/usr/include/irrKlang
  install -m644 ${srcdir}/irrKlang-${_folderver}/include/* ${pkgdir}/usr/include/irrKlang/

  install -Ddm644 ${srcdir}/irrKlang-${_folderver}/doc ${pkgdir}/usr/share/doc/irrKlang/

  mkdir -p ${pkgdir}/usr/share/irrKlang/
  cp -r ${srcdir}/irrKlang-${_folderver}/examples ${pkgdir}/usr/share/irrKlang/examples
  cp -r ${srcdir}/irrKlang-${_folderver}/media ${pkgdir}/usr/share/irrKlang/media
  find ${pkgdir} -type d -exec chmod 755 '{}' \;

  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/irrKlang/LICENSE

  install -Dm644 ${srcdir}/irrKlang.pc ${pkgdir}/usr/lib32/pkgconfig/irrKlang.pc
}
