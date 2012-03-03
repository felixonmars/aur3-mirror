# Contributor: Hubert Star <hubertstar@gmail.com>

pkgname=netcfg-auto
pkgver=0.2
pkgrel=2
pkgdesc="Auto Detect Network Profile, I modified the net-profiles script and add auto detect function."
arch=('any')
url='http://www.archlinux.org'
license=('GPL2')
depends=('netcfg' 'net-tools')
install=netcfg-auto.install
source=("netcfg-auto.sh")

build() {
  install -Dm755 ${srcdir}/${pkgname}.sh ${pkgdir}/etc/rc.d/${pkgname}
}

md5sums=("d3fffbc9178fa99289b9ff9a8e2e8f1c")
