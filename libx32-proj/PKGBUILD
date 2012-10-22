# $Id: PKGBUILD 70419 2012-05-05 19:41:23Z jlichtblau $
# Upstream Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>
# Maintainer: Fantix King <fantix.king at gmail.com>

_basepkgname=proj
pkgname=libx32-proj
pkgver=4.8.0
pkgrel=1.1
pkgdesc='Cartographic Projections library (x32 ABI)'
arch=('x86_64')
url="http://trac.osgeo.org/proj/"
license=('MIT')
options=('!libtool')
depends=("${_basepkgname}=${pkgver}")
changelog=$_basepkgname.changelog
source=("http://download.osgeo.org/proj/$_basepkgname-$pkgver.tar.gz"
        "http://download.osgeo.org/proj/$_basepkgname-datumgrid-1.5.zip"
        "chenyx06a.zip::http://www.swisstopo.admin.ch/internet/swisstopo/en/home/topics/survey/lv03-lv95/chenyx06/distortion_grids.parsys.65772.downloadList.94632.DownloadFile.tmp/chenyx06antv2.zip")
sha256sums=('2db2dbf0fece8d9880679154e0d6d1ce7c694dd8e08b4d091028093d87a9d1b5'
            '723c4017d95d7a8abdf3bda4e18d3c15d79b00f9326d453da5fdf13f96c287db'
            'f61290a32815622bfe182af475c76b0b4c282de66121fdddce2f6201e8bca2e0')

build() {
  bsdtar -xzvf "${srcdir}/${_basepkgname}-datumgrid-1.5.zip" -C "${srcdir}/proj-${pkgver}/nad"
  bsdtar -xzvf "${srcdir}/chenyx06a.zip" -C "${srcdir}/proj-${pkgver}/nad" CHENYX06a.gsb

  cd ${srcdir}/$_basepkgname-$pkgver

  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/libx32
  make
}

package() {
  cd ${srcdir}/$_basepkgname-$pkgver

  make DESTDIR=${pkgdir} install

  rm -rf "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/include"
  rm -rf "${pkgdir}/usr/share"

  # install license
  install -dm755 "$pkgdir"/usr/share/licenses
  ln -s ${_basepkgname} "${pkgdir}"/usr/share/licenses/${pkgname}
}
