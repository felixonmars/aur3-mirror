# Maintainer: Dan Serban

pkgname=pdfchain-all-inclusive
pkgver=0.x.x.latest
pkgrel=1
pkgdesc="Combo package: PDF Chain and pdftk"
depends=(gtkmm3)
makedepends=(intltool lynx)
provides=(pdftk pdftk-bin pdfchain)
conflicts=(pdftk pdftk-bin pdfchain)
license=(GPLv3)
url=http://pdfchain.sourceforge.net/
arch=(i686 x86_64)
_filearch=i386
[ "${CARCH}" == "x86_64" ] && _filearch=amd64

build()
{
  _url_prefix="http://ftp.nl.debian.org/debian/pool/main"

  # --- pdftk ---
  rm pdftk_*.deb 2>/dev/null || true
  _url=$(lynx -dump ${_url_prefix}/p/pdftk/ | grep -o http.*/pdftk_.*_${_filearch}\.deb | tail -1)
  wget ${_url}
  bsdtar -xf $(basename ${_url}) data.tar.gz
  bsdtar -xf data.tar.gz -C "${pkgdir}"
  rm data.tar.gz

  # --- libgcj12 ---
  rm libgcj12_*.deb 2>/dev/null || true
  _url=$(lynx -dump ${_url_prefix}/g/gcj-4.6/ | grep -o http.*/libgcj12_.*_${_filearch}\.deb | tail -1)
  wget ${_url}
  bsdtar -xf $(basename ${_url}) data.tar.gz
  bsdtar -xf data.tar.gz || true
  rm data.tar.gz
  install -Dm755 $(find usr/lib -type f | grep libgcj.so) "${pkgdir}"/usr/lib/libgcj.so.12
  rm -r usr

  # --- pdfchain ---
  rm pdfchain.tar.gz 2>/dev/null || true
  _url=$(lynx -dump http://sourceforge.net/projects/pdfchain/ | grep -o http.*projects.*download)
  wget -O pdfchain.tar.gz "${_url}"
  bsdtar -xf pdfchain.tar.gz
  cd $(ls -1d pdfchain-*/ | tail -1)
  ./configure
  make
  make prefix="${pkgdir}"/usr install
}

