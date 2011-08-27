# Contributor: Hubert Czobodziñski <hcz@onet.eu>
pkgname=xlispstat
pkgver=3.52.20
pkgrel=4
pkgdesc="Statistical environment based on Lisp"
arch=('i686')
url="http://lib.stat.cmu.edu/xlispstat/"
license=('xlispstat')
depends=('libx11')
source=(ftp://ftp.stat.umn.edu/pub/xlispstat/3-52/${pkgname}-3-52-20.tar.gz fmax.patch)
md5sums=(93ec54218aaa450f0909e4a3ba22e08f 52b567117c7de5055355cd7a6d41e998)

build() {
  cd ${startdir}/src
  patch -p0 < fmax.patch
  cd ${pkgname}-3-52-20
  ./configure --prefix=/usr || return 1
  make || return 1
  make prefix=${startdir}/pkg/usr install || return 1

  install -D -m644 ${startdir}/src/${pkgname}-3-52-20/COPYING \
                   ${startdir}/pkg/usr/share/licenses/${pkgname}/license.txt
}
