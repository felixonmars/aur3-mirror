# Maintainer: fluxius <fluxius AT handgrep DOT se>
# for lib32 look for q3k's package : https://aur.archlinux.org/packages/li/lib32-libaudio2/PKGBUILD

pkgname=lib64-libaudio2
pkgver=1.9.3_5
pkgrel=1
_pkgver=1.9.3
_pkgrel64=5
pkgdesc="A package that installs libaudio.so.2 for x86_64"
arch=('x86_64')
url="http://www.radscan.com/nas.html"
license=('custom')
groups=('lib64')
depends=('libxt')
makedepends=(pkgextract)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://security.ubuntu.com/ubuntu/pool/main/n/nas/libaudio2_${_pkgver}-${_pkgrel64}_amd64.deb" "LICENSE")
noextract=()

build() {

  pkgextract.sh libaudio2_${_pkgver}-${_pkgrel64}_amd64.deb
  mkdir -p ${pkgdir}/usr/lib64
  cp -R ${srcdir}/usr/lib/x86_64-linux-gnu/libaudio* $pkgdir/usr/lib64/
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}

md5sums=('f7d561ac4994d3076f5215d3bcbbd564'
         'd80eea83bd4e5d57c810c05484183ea6')
