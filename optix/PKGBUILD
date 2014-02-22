pkgname=optix
pkgver=3.0.1
pkgrel=1
pkgdesc="NVIDIA Optix Ray Tracing Engine"
arch=(x86_64)
url="https://developer.nvidia.com/optix"
license=('custom')
depends=(cuda)
makedepends=()
provides=()
conflicts=()
replaces=()
source=(http://developer.download.nvidia.com/assets/tools/files/optix/3.0.1/NVIDIA-OptiX-SDK-3.0.1-linux64-cuda50.run)
md5sums=('e0a9fa60a505b911c58a2930b51b7885')

build(){
	mkdir etc
	mkdir etc/ld.so.conf.d
	mkdir etc/profile.d	
	mkdir opt
	mkdir opt/optix
	tail -n +384 NVIDIA-OptiX-SDK-${pkgver}-linux64-cuda50.run | gunzip | (cd opt/optix  && tar xf -)
	echo /opt/optix/lib64 > etc/ld.so.conf.d/optix.conf
}

package(){
	cp -r opt $pkgdir/
	cp -r etc $pkgdir/
	
}
