# Maintainer: Iru Cai <mytbk920423 [at] gmail [dot] com>

pkgname=fqterm-bin
pkgver=0.9.6.10
pkgrel=1
pkgdesc="A cross-platform terminal emulator program which supports telnet/ssh1/ssh2"
arch=('i686' 'x86_64')
url="http://code.google.com/p/${pkgname}/"
license=('GPL2')
depends=('qt4' 'python2')
makedepends=('')
conflicts=('fqterm' 'fqterm-svn')
if [[ ${CARCH} == 'x86_64' ]];then
source=("http://mirrors.tuna.tsinghua.edu.cn/debian/pool/main/f/fqterm/fqterm_${pkgver}-1.1_amd64.deb")
md5sums=('0e5417e2c0f7ef50f54de077d7b29a64')
else
source=("http://mirrors.tuna.tsinghua.edu.cn/debian/pool/main/f/fqterm/fqterm_${pkgver}-1.1_i386.deb")
md5sums=('d01624b3ff410175c868e27180d7acf1')
fi

build() {
	true
}

package() {
    cd ${srcdir}
	tar xf data.tar.gz -C ${pkgdir}
}

