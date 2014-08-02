# Maintainer: Sebastien Bariteau <numkem@gmail.com>
pkgname=php-horde-imap_client
_hordename=Horde_Imap_Client
pkgver=2.23.2
pkgrel=1
pkgdesc="Interface to access IMAP4rev1 (RFC 3501) mail servers."
url="http://http://pear.horde.org/"
arch=('any')
license=('LPGL')
source=("http://pear.horde.org/get/${_hordename}-${pkgver}.tgz")
md5sums=('82e8bc21d2c5dcca5168c0076d5233cd')
depends=('php' 'php-horde-exception' 'php-horde-mail' 'php-horde-mime' 'php-horde-stream' 'php-horde-util')

build() {
  cd ${srcdir}/${_hordename}-${pkgver}/
  
  mkdir -p ${pkgdir}/usr/share/pear/
  cp -r ./lib/* ${pkgdir}/usr/share/pear/
  cp -r ./test/* ${pkgdir}/usr/share/pear/test/
}
