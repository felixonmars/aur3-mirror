# Contributer: Jamie Nguyen <dyscoria@googlemail.com>

pkgname=knock-once
pkgver=1.2
pkgrel=1
pkgdesc="A BASH script to create and manage one-time sequences for knockd"
arch=('i686' 'x86_64')
url='http://www.sourceforge.net/projects/knockonce/'
license=('GPL')
depends=('bash' 'knockd>=0.5')
source=(http://downloads.sourceforge.net/knockonce/knock-once-${pkgver}.tar.gz)
sha256sums=('ae55308f1f5428653638d430fab008ef3db931970f5443a92c4297703788a786')

build()
{
  cd ${srcdir}/knock-once-${pkgver}
  install -D -m755 knock-once ${pkgdir}/usr/bin/knock-once || return 1
  install -D -m644 knock-once.1.gz \
	  ${pkgdir}/usr/share/man/man1/knock-once.1.gz || return 1
}
