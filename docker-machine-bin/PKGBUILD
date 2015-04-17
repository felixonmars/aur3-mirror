# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>
 
pkgname=docker-machine-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Machine management for a container-centric world'
arch=('i686' 'x86_64')
url='https://github.com/docker/machine'
install="docker-machine-bin.install"
license=('Apache')
depends=()
provides=('docker-machine')
conflicts=('docker-machine')

_arch=amd64
[[ $CARCH = i686 ]] && _arch=386

source=("docker-machine::https://github.com/docker/machine/releases/download/v${pkgver//_/-}/docker-machine_linux-${_arch}")

sha256sums=('24a95d55524e6db84ac9db1cef0eba6ca764989d92dbcb8e28f778b7e1c6a0dd')
[[ $CARCH = i686 ]] && sha256sums[0]='e047e71c544b32751dbb9e9796fdf4e540cd9177d22699862775a4b09267578e'

package() {
    install -Dm755 docker-machine "${pkgdir}/usr/bin/docker-machine"
}
