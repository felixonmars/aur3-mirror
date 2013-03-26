# Contributor: Aaron Chen <nextAaron at gmail.com>

_gitrepo=https://github.com/nvmeqemu/nvmeqemu.git 
_gitname=nvmeqemu
pkgname=$_gitname-git
pkgver=1.6.0.11.gac855bd
pkgrel=2
pkgdesc="QEMU for NVM Express"
arch=(x86_64)
url="http://github.com/nvmeqemu/nvmeqemu"
license=(GPL)
depends=(sdl zlib libaio gnutls)
makedepends=(git linux-headers)
conflicts=(qemu)
provides=(qemu)
options=()
source=(0001-Fix-for-Arch-Linux.patch)
md5sums=(4deff5382ec7bb24853963bfcd90b178)

pkgver() {
  cd $srcdir/$_gitname
  git describe --always | sed 's/.*=//' | sed 's/-/./g'
}

build() {
  cd $srcdir
  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin
  else
    git clone --depth 1 $_gitrepo
    cd $_gitname
  fi
  patch -Np1 -i ../0001-Fix-for-Arch-Linux.patch

  LIBS+=-lrt ./configure --prefix=/usr --enable-io-thread --enable-linux-aio --target-list=x86_64-softmmu --enable-sdl
  make DESTDIR=$pkgdir install
}
