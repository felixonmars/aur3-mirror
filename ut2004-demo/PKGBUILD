pkgname=ut2004-demo
pkgver=3334
pkgrel=3
pkgdesc="Unreal Tournament 2004 demo"
url="http://www.unrealtournament.com/"
license="custom"
depends=('libxext' 'libstdc++5')
makedepends=()
arch=('i686' 'x86_64')
source=(http://treefort.icculus.org/ut2004/UT2004-LNX-Demo${pkgver}.run.gz ut2004-demo.sh ut2004-demo.desktop)
md5sums=('93d8afc8fac1aaddca2daac3b9cd855c' '2ad344f0298beb694a439e506f5ef583' '49374b122c3e6ff046bf9bff9769eb08')

package() {
	fullname=UT2004-LNX-Demo${pkgver}.run
	cd ${srcdir}
	chmod +x $fullname
	./$fullname --noexec --keep --target tmp
	mkdir -p ${pkgdir}/opt/$pkgname ${pkgdir}/usr/bin
	cd ${pkgdir}/opt/$pkgname
	tar -xjf ${srcdir}/tmp/ut2004demo.tar.bz2 || return 1
	case `uname -m` in
		x86_64 | amd64)
			arch=amd64;;
		i?86 | i86*)
			arch=x86;;
		*)
			echo "Unknown architecture, assuming x86"
			arch=x86
	esac
	tar -xjf ${srcdir}/tmp/linux-$arch.tar.bz2 || return 1
	tar -xzf ${srcdir}/tmp/setupstuff.tar.gz README.linux ut2004.xpm || return 1
	install -m755 -D ${srcdir}/$pkgname.sh ${pkgdir}/opt/$pkgname/$pkgname
	ln -sf /opt/$pkgname/$pkgname ${pkgdir}/usr/bin/$pkgname
	mkdir -p ${pkgdir}/usr/share/applications
	cp ${srcdir}/$pkgname.desktop ${pkgdir}/usr/share/applications/
}

