# Maintainer: Zeroedout alishams(.)hassam@gmail.com
# Contributor: M0Rf30

pkgname=cudaminer-git
pkgver=203.6bfc1e4
pkgrel=1
pkgdesc="CUDA accelerated mining application for Litecoin."
url="https://github.com/cbuchner1/CudaMiner"
arch=('i686' 'x86_64')
license=('GPL')
depends=('cuda')
optdepends=('stratum-mining-proxy-git: to connect to Stratum mining pools')
makedepends=('git')
options=(!buildflags)
conflicts=('cudaminer')
source=('cudaminer::git+https://github.com/cbuchner1/CudaMiner.git' cudaminer.conf cudaminer.service)
backup=(etc/cudaminer.conf)

build() {
  cd cudaminer
  ./autogen.sh
  chmod +x configure
  ./configure --prefix=/usr --with-cuda=/opt/cuda
# Add -ldd to cudaminer_LDADD variable in Makefile as per bug 115 https://github.com/cbuchner1/CudaMiner/issues/115 
  sed  "398s/cudaminer_LDADD = -lcurl -ljansson -lpthread  -lcudart -fopenmp -lcrypto -lssl/cudaminer_LDADD = -lcurl -ljansson -lpthread  -lcudart -fopenmp -lcrypto -lssl -ldl/" -i Makefile  
  make CFLAGS="-march=native -mtune=native"
}

package(){
  cd cudaminer
  make DESTDIR=$pkgdir install
  install -D -m644 README.txt ${pkgdir}/usr/share/doc/cudaminer/README
  install -Dm644 ${srcdir}/cudaminer.conf ${pkgdir}/etc/cudaminer.conf
  install -Dm644 ${srcdir}/cudaminer.service ${pkgdir}/usr/lib/systemd/system/cudaminer.service
}

pkgver() {
  cd cudaminer
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP'
				 'a4ff38fa406ffda150cd76fc784aff1c'
         '60ffd65aa8451883136532f9771128d5')

