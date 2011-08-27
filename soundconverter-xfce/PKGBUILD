# Maintainer: Dan Serban
# Contributor: Andrea `BaSh` Scarpino <bash.lnx@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=soundconverter-xfce
pkgver=1.5.4
pkgrel=1
pkgdesc="A simple sound converter application, patched for XFCE (gnome-python dependency removed)"
arch=(any)
license=(GPLv3)
url=http://soundconverter.berlios.de/
depends=(gstreamer0.10-ugly-plugins gstreamer0.10-good-plugins gstreamer0.10-python hicolor-icon-theme python2-gnomevfs)
optdepends=('gstreamer0.10-base-plugins: for ogg support')
install=soundconverter-xfce.install
source=(soundconverter.patched)
md5sums=('679708317bc38a7c54d89eacd9231f52')

build()
{
  _tar_file="soundconverter-${pkgver}-1-any.pkg.tar"
  _file="${_tar_file}.xz"
  wget "http://mirrors.kernel.org/archlinux/community/os/i686/${_file}"
  unxz "${_file}"
  bsdtar -xf "${_tar_file}" -C "${pkgdir}"
  install -Dm755 soundconverter.patched "${pkgdir}"/usr/bin/soundconverter
}

