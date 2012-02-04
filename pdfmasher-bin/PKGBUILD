# Maintainer: Dan Serban

pkgname=pdfmasher-bin
pkgver=0.x.x.latest
pkgrel=1
pkgdesc="Convert PDF files containing text into ready-for-ebook HTML files"
arch=(i686 x86_64)
url=http://www.hardcoded.net/pdfmasher/
license=(custom:Fairware)
depends=(libxml2 libxslt python pyqt sip)
makedepends=(lynx)
_filearch="i386"
[ "${CARCH}" == "x86_64" ] && _filearch="amd64"

build()
{
  rm pdfmasher_*.deb 2>/dev/null || true
  _url=$(lynx -dump "http://www.hardcoded.net/pdfmasher/" | grep -o http.*${_filearch}.deb | tail -1)
  wget ${_url}
  bsdtar -xf $(basename ${_url}) data.tar.gz
  bsdtar -xf data.tar.gz
  rm data.tar.gz
  rm usr/local/share/pdfmasher/sip.so
  cd usr/local/share/pdfmasher
  rm -r PyQt4
  mkdir -p "${pkgdir}"/usr/bin
  cd "${srcdir}"/usr
  mv share "${pkgdir}"/usr/
  cd local/share
  mv pdfmasher "${pkgdir}"/usr/share/
  cd "${srcdir}"
  rm lxml.tgz 2>/dev/null || true
  _url=$(lynx -dump "http://lxml.de/" | grep -o http.*tgz | grep -v alpha | grep -v beta | head -1)
  wget -O lxml.tgz "${_url}"
  bsdtar -xf lxml.tgz
  cd $(ls -1d lxml-*/ | tail -1)
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  USRBINFILE="${pkgdir}"/usr/bin/pdfmasher
  echo "#!/bin/bash" > "${USRBINFILE}"
  echo "cd /usr/share/pdfmasher" >> "${USRBINFILE}"
  echo "python run.py" >> "${USRBINFILE}"
  chmod +x "${USRBINFILE}"
}

