# Maintainer: Dan Serban

pkgname=ambiance-radiance-colors-xfce-lxde
pkgver=11.10.1.0.7.oneiric1
pkgrel=1
pkgdesc="Combo package: Ambiance Colors and Radiance Colors themes for XFCE and LXDE"
arch=(any)
url="https://launchpad.net/~ravefinity-project/+archive/ppa"
license=(LGPL3)
depends=(gtk-engine-murrine gtk-engine-unico)
# makedepends=(lynx)

build()
{
  rm ambiance.deb radiance.deb 2>/dev/null || true
  wget -O ambiance.deb "http://ppa.launchpad.net/ravefinity-project/ppa/ubuntu/pool/main/a/ambiance-colors-xfce-lxde/ambiance-colors-xfce-lxde_11.10.1-0~10~oneiric1_all.deb"
  bsdtar -xf ambiance.deb data.tar.gz
  bsdtar -xf data.tar.gz -C "${pkgdir}"
  rm data.tar.gz
  wget -O radiance.deb "http://ppa.launchpad.net/ravefinity-project/ppa/ubuntu/pool/main/r/radiance-colors-xfce-lxde/radiance-colors-xfce-lxde_11.10.1-0~7~oneiric1_all.deb"
  bsdtar -xf radiance.deb data.tar.gz
  bsdtar -xf data.tar.gz -C "${pkgdir}"
  rm data.tar.gz
}

