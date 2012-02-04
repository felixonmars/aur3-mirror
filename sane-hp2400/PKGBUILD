# Maintainer: sanderd17 <sanderd17 at gmail dot com>

pkgname=sane-hp2400
pkgver=1.0.22
pkgrel=1
pkgdesc="64bit sane drivers with patch for the HP 2400 scanners" 
url="http://plaidcounty.deviantart.com/art/Capazul-261822655"
license=('GPLv3')
arch=('x86_64')
makedepends=('')
optdepends=()
provides=('sane')
conflicts=('sane')
source=("https://launchpad.net/~lion-simba/+archive/hp2400-genesys/+build/2922926/+files/libsane_1.0.22-2ubuntu2hp24ppa1%7Eoneiric_amd64.deb" "https://launchpad.net/~lion-simba/+archive/hp2400-genesys/+build/2922926/+files/sane-utils_1.0.22-2ubuntu2hp24ppa1%7Eoneiric_amd64.deb")
noextract=("sane-utils_1.0.22-2ubuntu2hp24ppa1%7Eoneiric_amd64.deb")

md5sums=('c38b680b70b93eb920be1fcec7dfe5df'
         '4cc23d621c8d0520dba9dd24c60006b5')




build() {
  tar -xzf ${srcdir}/data.tar.gz -C ${pkgdir}/ 
  bsdtar -xf sane-utils_1.0.22-2ubuntu2hp24ppa1%7Eoneiric_amd64.deb
  tar -xzf  ${srcdir}/data.tar.gz -C ${pkgdir}/

}




