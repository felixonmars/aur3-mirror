# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=nepomuk-metadata-extractor
pkgver=0.3
pkgrel=2
pkgdesc="Finds additional metadata on the internet (via Python plugins) and adds it to nepomuk"
arch=('i686' 'x86_64')
url="http://joerg-weblog.blogspot.de/search/label/Metadata Extractor"
license=('GPL')
depends=('nepomuk-core' 'poppler-qt' 'taglib' 'kdebindings-kross-python')
makedepends=('cmake' 'automoc4' 'doxygen')
optdepends=("imdbpy: for the IMDB plugin" "python2-beautifulsoup3: for the Microsoft Academics Search, Nature Publishing Group and Springer Link plugins" "python2-httplib2: for the Microsoft Academics Search, Nature Publishing Group and Springer Link plugins" "python2-musicbrainzngs: for the MusicBrainz plugin" "tvdb_api: for the TVDb and MyAnimeList plugins" "python2-requests: for the MyAnimeList plugin") 
install=
source=("nepomuk-metadata-extractor.tar.gz::http://quickgit.kde.org/index.php?p=nepomuk-metadata-extractor.git&a=snapshot&h=f4dd1d92d04682d627e1fd14d30f0bdbb7148789&fmt=tgz")
md5sums=('d530aeeb0d793ab0f9a78937fdec2890')

build() {
  cd $pkgname
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname/build
  make DESTDIR=$pkgdir install

# fix conflicts with nepomuk-core
  rm -fr $pkgdir/usr/share/dbus-1

# use python2
  sed -i 's:#!/usr.bin/python:#!/usr/bin/python2:' $pkgdir/usr/share/apps/nepomukmetadataextractor/plugins/*.py
}
