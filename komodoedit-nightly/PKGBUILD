# Maintainer: Dan Serban
# Contributor: max-k

pkgname=komodoedit-nightly
pkgver=6.x.x.latest
pkgrel=1
pkgdesc="Open-Source version of the Komodo IDE"
arch=(i686 x86_64)
url=http://www.openkomodo.com/
license=(MPL)
depends=(gcc-libs glibc gtk2 libjpeg)
makedepends=(lynx)
conflicts=(komodoedit komodoedit-beta)
_filearch=x86
[ "${CARCH}" == "x86_64" ] && _filearch=x86_64

build()
{
  rm *.tar.gz 2>/dev/null || true
  msg "Locating remote source file..."
  _url_prefix="http://downloads.activestate.com/Komodo/nightly/komodoedit/2011/"
  _url_prefix=$(lynx -dump "${_url_prefix}" | grep -o http://downloads.*$ | tail -1)
  _url_prefix=$(lynx -dump "${_url_prefix}" | grep -o http://downloads.*$ | tail -1)
  _url=$(lynx -dump "${_url_prefix}" | grep -o http://downloads.*${_filearch}.tar.gz | tail -1)
  wget ${_url}
  bsdtar -xf $(basename ${_url})
  cd $(ls -1d Komodo-Edit-*/)
  ./install.sh -s -I "${pkgdir}"/opt/komodoedit-nightly
  grep -v "${startdir}" "${pkgdir}"/opt/komodoedit-nightly/share/desktop/komodo-edit-*.desktop > "${startdir}"/komodoedit-nightly.desktop
  echo "Exec=/opt/komodoedit-nightly/bin/komodo" >> "${startdir}"/komodoedit-nightly.desktop
  echo "Icon=/opt/komodoedit-nightly/share/icons/komodo16.png" >> "${startdir}"/komodoedit-nightly.desktop
  install -Dm644 "${startdir}"/komodoedit-nightly.desktop "${pkgdir}"/usr/share/applications/komodoedit-nightly.desktop
}

