pkgname=mhlt
pkgver=253_17_unix
pkgrel=1
pkgdesc="Merl's versions of the Zoner's Half-Life Tools tools (zhlt)"
url="http://zhlt.info/download-zhlt.html"
arch=('x86_64' 'i686')
license=('custom')
depends=('commoncpp2')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://downloads.ammahls.com/zhlt/Old%20SDK%20Code/Linux/${pkgname}-${pkgver//_/-}.tar.gz")
md5sums=('9355d806c90014de29b2145e2b195e2d')

build() {
	cd "${srcdir}/${pkgname}-${pkgver//_/-}"
	sed -i 's|(int)((winding_t\*)0)->points\[points\]|sizeof(int)+sizeof(bool)+points*sizeof(vec3_t)|' hlvis/vis.cpp
	sed -i 's|m_Cancelled.Wait|m_Cancelled.wait|' netvis/ZHLTThread.h
	sed -i 's|return sum / num|return sum / size|' template/BaseMath.h
	sed -i 's|Run()|run()|' netvis/SocketThreads.cpp
	sed -i 's|Start()|start()|' netvis/SocketThreads.cpp
	sed -i 's|EnterMutex()|enterMutex()|' netvis/packet.cpp
	sed -i 's|LeaveMutex()|leaveMutex()|' netvis/packet.cpp
	sed -i 's|Run()|run()|' netvis/NetvisSession.h
	sed -i 's|Terminate()|terminate()|' netvis/NetvisSession.h
	sed -i 's|Run()|run()|' netvis/NetvisSession.cpp
	sed -i 's|Start()|start()|' netvis/NetvisSession.cpp
	sed -i 's|SOCKET_PENDING_ERROR|Socket::pendingError|' netvis/NetvisSession.cpp
	sed -i 's|SOCKET_PENDING_INPUT|Socket::pendingInput|' netvis/NetvisSession.cpp
	sed -i 's|EnterMutex()|enterMutex()|' netvis/NetvisSession.cpp
	sed -i 's|LeaveMutex()|leaveMutex()|' netvis/NetvisSession.cpp
	sed -i 's|SOCKET_BINDING_FAILED|Socket::errBindingFailed|' netvis/NetvisSession.cpp
	sed -i 's|lccgnu|lccgnu2|' netvis/make.inc
	sed -i '1s/^/#include <assert.h>\n/' template/BaseMath.h
	sed -i '1s/^/#define Sleep(x) usleep(x*1000)\n/' netvis/SocketThreads.cpp
	sed -i '1s/^/#define Sleep(x) usleep(x*1000)\n/' netvis/NetvisSession.cpp
	sed -i '1s/^/#include <limits.h>\n/' ./common/mathlib.h
	unset CPPFLAGS
	unset CXXFLAGS
	unset CFLAGS
	./configure
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver//_/-}/release"
	install -Dm755 hlbsp "$pkgdir/usr/bin/hlbsp"
	install -Dm755 hlcsg "$pkgdir/usr/bin/hlcsg"
	install -Dm755 hlrad "$pkgdir/usr/bin/hlrad"
	install -Dm755 hlvis "$pkgdir/usr/bin/hlvis"
	install -Dm755 netvis "$pkgdir/usr/bin/netvis"
	install -Dm755 ripent "$pkgdir/usr/bin/ripent"
}
