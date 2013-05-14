# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=nepomuk-webminer
pkgver=0.6
pkgrel=2
pkgdesc="Finds additional metadata on the internet (via Python plugins) and adds it to nepomuk"
arch=('i686' 'x86_64')
url="http://joerg-weblog.blogspot.de/search/label/Metadata Extractor"
license=('GPL')
depends=('nepomuk-core' 'kdebindings-kross-python')
makedepends=('cmake' 'automoc4' 'doxygen' 'kdebindings-python2')
optdepends=("imdbpy: for the IMDB plugin" "python2-beautifulsoup3: for the Microsoft Academics Search, Nature Publishing Group and Springer Link plugins" "python2-httplib2: for the Microsoft Academics Search, Nature Publishing Group, Springer Link, The Movie Database and MyAnimeList plugins" "python2-musicbrainzngs: for the MusicBrainz plugin" "tvdb_api: for the TVDb and MyAnimeList plugins") 
install=
replaces=('nepomuk-metadata-extractor')
provides=('nepomuk-metadata-extractor')
source=("http://kde-apps.org/CONTENT/content-files/158627-$pkgname-$pkgver.zip")
md5sums=('e34290bd53f9b8f4f5aba9413e5991e1')

prepare() {
  sed -i 's:#!/usr/bin/env python:#!/usr/bin/env python2:' nepomuk-simpleresource-rcgen.py
}

build() {
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install

# use python2
  sed -i 's:#!/usr.bin/python:#!/usr/bin/python2:' $pkgdir/usr/share/apps/nepomuk-webminer/plugins/*.py
}
