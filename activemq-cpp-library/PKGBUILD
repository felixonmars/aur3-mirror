# Packer: <csgeek@esamir.com> 

pkgname=activemq-cpp-library
pkgver=3.2.3
pkgrel=1
pkgdesc="CMS is a JMS-like API for C++ for interfacing with Message Brokers such as Apache ActiveMQ."
arch=('i686' 'x86_64')
license=('Apache 2.0')
url="http://activemq.apache.org/cms/"
depends=('autoconf' )
makedepends=('')
optdepends=()
options=()
provides=('activemq-cpp-library')
conflicts=('activemq-cpp-library')
source=(http://mirror.atlanticmetro.net/apache//activemq/activemq-cpp/source/${pkgname}-${pkgver}-src.tar.gz)
md5sums=('f4a3db74eeb874aee925714bcb3c2c84')


build() 
{
  echo "This is my first attempt at making this package.. might be buggy...resuming in 10 seconds"
  echo "Hit Ctrl+C to abort..."
  sleep 10
  cd ${pkgname}-${pkgver}
  ./configure
  make
  make DESTDIR=${pkgdir} install
}
