## Maintainer: guillaumezin at https://github.com/guillaumezin
pkgname=nvidiabl-git
pkgver=1.0
pkgrel=1
pkgdesc="A package which provide backlight adjustment support to laptops using the nvidia drivers"
license=('GPLv3')
depends=('dkms' 'git')
makedepends=()
conflicts=()
replaces=()
backup=()
install='nvidiabl.install'
arch=('any')
url=('https://github.com/guillaumezin/nvidiabl')
gitname=https://github.com/guillaumezin/nvidiabl.git


build() {
  cd ~
  git clone ${gitname} nvidiabl
  cd ~/nvidiabl
  make dkms-install
  mv ~/nvidiabl/scripts/usr/local/share/nvidiablctl /usr/local/share/nvidiabl
  rm -R ~/nvidiabl
  
  
  
  
  
}

