# Maintainer: Dan Serban
# Contributor: imrahil <hugo_alobo@hotmail.com>

pkgname=gtk2-ia_ora
pkgver=1.0.25
pkgrel=1
pkgdesc="Default Mageia theme for GTKv2"
url=http://www.mageia.org/en/
arch=(i686 x86_64)
license=GPL
depends=(gtk2)
makedepends=(lynx rpmextract)
_mageia_repo_arch=i586
[ "${CARCH}" == "x86_64" ] && _mageia_repo_arch=x86_64

_url_prefix="http://distrib-coffee.ipsl.jussieu.fr/pub/linux/Mageia/distrib/1/${_mageia_repo_arch}/media/core/release/"

build()
{
  rm *.rpm 2>/dev/null || true
  msg "Locating remote source files..."
  lynx -dump ${_url_prefix} | grep -o http.*ia_ora.*${_mageia_repo_arch}.rpm > tmpfile.txt
  msg "Downloading, extracting and packaging..."
  _url=$(grep "/libia_ora-gnome-1" tmpfile.txt)
  wget ${_url}
  rpm2cpio $(basename ${_url}) | bsdtar -x -C "${pkgdir}" -f -
  _url=$(grep "/ia_ora-gnome-1" tmpfile.txt)
  wget ${_url}
  rpm2cpio $(basename ${_url}) | bsdtar -x -C "${pkgdir}" -f -
  _url=$(grep "/ia_ora-xfce-1" tmpfile.txt)
  wget ${_url}
  rpm2cpio $(basename ${_url}) | bsdtar -x -C "${pkgdir}" -f -
}

