# Maintainer: Martin Lee <hellnest.fuah@gmail.com>
# Contributor: Huulivoide

pkgname=xcursor-mac
pkgver=1
pkgrel=2
_file=mac_os_cursors_by_rian76-d3dtuei.7z
pkgdesc="X-Cursor Mac OS Theme"
arch=('any')
url="http://rian76.deviantart.com/art/Mac-OS-cursors-204625962"
license=('custom')
makedepends=('p7zip' 'xorg-xcursorgen')
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
source=('http://www.deviantart.com/download/204625962/mac_os_cursors_by_rian76-d3dtuei.7z'
        'index.theme')

build() {
  cd "${scrdir}"
  7z x "${_file}"
  
  # Perpare specified location
  mkdir -p "${pkgdir}/usr/share/icons/${pkgname}"
  tar -xf SL.tar.gz

  cd SL
  rm -fr cursors/*
  ./make.sh

  cp -r cursors "${pkgdir}/usr/share/icons/${pkgname}/"
  install -Dm644 ../index.theme "${pkgdir}/usr/share/icons/${pkgname}/"
}

sha256sums=('ef35ebb57b8b8744ac07068f6b9dcc478be46e6471d90d20d2af571941cf0c52'
            'e5f15b82155a5937a23970c5f3aa3557c89677b05de0ad69b119d343e8a5bd0b')
