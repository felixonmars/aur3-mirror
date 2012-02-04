# Maintainer: Dan Serban

pkgname=ambiance-radiance-colors-xfce-lxde
pkgver=0.1.0.1.oneiric1
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
  wget -O ambiance.deb http://ppa.launchpad.net/ravefinity-project/ppa/ubuntu/pool/main/a/ambiance-colors-lxxf/ambiance-colors-lxxf_0.1-0~1~oneiric1_all.deb
  bsdtar -xf ambiance.deb data.tar.gz
  bsdtar -xf data.tar.gz -C "${pkgdir}"
  rm data.tar.gz
  wget -O radiance.deb http://ppa.launchpad.net/ravefinity-project/ppa/ubuntu/pool/main/r/radiance-colors-lxxf/radiance-colors-lxxf_0.1-0~1~oneiric1_all.deb
  bsdtar -xf radiance.deb data.tar.gz
  bsdtar -xf data.tar.gz -C "${pkgdir}"
  rm data.tar.gz
}

