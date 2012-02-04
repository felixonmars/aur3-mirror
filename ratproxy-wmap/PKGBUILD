pkgname=ratproxy-wmap
pkgver=1.58
pkgrel=1
pkgdesc="A passive web application security assessment tool, patched for usage with the Metasploit WMAP plugin"
url="http://code.google.com/p/ratproxy/"
license=('APACHE')
arch=('i686' 'x86_64')
provides=('ratproxy')
conflicts=('ratproxy')
source=("http://ratproxy.googlecode.com/files/ratproxy-${pkgver}.tar.gz"
        "ratproxy_wmap.diff")
md5sums=('e4d5e64a0bd8f8f92032cbcee77fb3cf'
         '0f78716d2559401373e234ea26d4079f')

build() {
cd $startdir/src/ratproxy
patch -Np1 -i ${srcdir}/ratproxy_wmap.diff || return 1

# build
make || return 1

# create directories and install files
mkdir -p $startdir/pkg/usr/local/ratproxy
mkdir -p $startdir/pkg/usr/bin
install -m755 $startdir/src/ratproxy/ratproxy $startdir/pkg/usr/bin/ratproxy
install -m755 $startdir/src/ratproxy/ratproxy-report.sh $startdir/pkg/usr/local/ratproxy/ratproxy-report.sh
install -m755 $startdir/src/ratproxy/ratproxy-back.png $startdir/pkg/usr/local/ratproxy/ratproxy-back.png
}
