#Contributor:figo.zhang <figo1802@gmail.com>
#Maintainer:Iru.Cai <mytbk920423@gmail.com>

pkgname=reciteword-bin
pkgver=0.8.4
pkgrel=9
pkgdesc="a education software to help people to study English"
arch=('i686' 'x86_64')
url="http://reciteword.cosoft.org.cn"
license=('GPL')
makedepends=()
depends=('esound')
conflicts=()
provides=('reciteword')

if [[ "$CARCH" = "i686" ]]; then
source=('http://mirror.6.tuna.tsinghua.edu.cn/fedora/releases/17/Everything/i386/os/Packages/r/reciteword-0.8.4-9.fc17.i686.rpm')
md5sums=('34d5dceea690427bec15c75bdce17376')
else
source=("http://mirrors.6.tuna.tsinghua.edu.cn/fedora/releases/17/Everything/x86_64/os/Packages/r/reciteword-0.8.4-9.fc17.x86_64.rpm")
md5sums=("fa20d3c0b536cfffa37f0b7ee91965b1")
fi

build() {
	cd ${srcdir}
	mv usr/ ${pkgdir}

	}

