# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>

pkgname=jdchub
pkgver=0.1.0
pkgrel=1
pkgdesc="A full featured ADC hub written on Java"
arch=('i686' 'x86_64')
url="http://jdchub.sincore.ru"
depends=('java-environment')
makedepends=()
license=("GPL2")
source=("http://jdchub.sincore.ru/attachments/download/52/jDcHub-${pkgver}-SNAPSHOT-dist.tar.bz2" "jdchub.d" "jdchub.conf")

package() 
{
  cd "${srcdir}/jDcHub-${pkgver}-SNAPSHOT"

  install -d "${pkgdir}/opt/jdchub"
  cp -a ./* "${pkgdir}/opt/jdchub/"
  
  install -m755 -D "${srcdir}/jdchub.d"                  "${pkgdir}/etc/rc.d/jdchub"
  install -m644 -D "${srcdir}/jdchub.conf"               "${pkgdir}/etc/conf.d/jdchub.conf"
}

md5sums=('a925d14efb09d497fd8de0edd088d24d'
         '938e89378910b6ccc8059432af617689'
         '8777ed2bf9b6b8f5526f329dcc2fc661')
