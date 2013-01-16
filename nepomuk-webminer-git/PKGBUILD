# Contributor: Antonio Rojas <nqn1976 @ gmail.com>
# Contributor: Fabio Zottele <fabio . zottele @ gmail . com>

pkgname=nepomuk-webminer-git
_appname=nepomuk-webminer
pkgver=20130110
pkgrel=1
pkgdesc="Finds additional metadata on the internet (via Python plugins) and adds it to nepomuk"
arch=('i686' 'x86_64')
url="http://joerg-weblog.blogspot.de/search/label/Metadata Extractor"
license=('GPL')
depends=('nepomuk-core' 'poppler-qt' 'taglib' 'kdebindings-kross-python')
makedepends=('cmake' 'automoc4' 'doxygen' 'git')
optdepends=("imdbpy: for the IMDB plugin" "python2-beautifulsoup3: for the Microsoft Academics Search, Nature Publishing Group and Springer Link plugins" "python2-httplib2: for the Microsoft Academics Search, Nature Publishing Group, Springer Link, The Movie Database and MyAnimeList plugins" "python2-musicbrainzngs: for the MusicBrainz plugin" "tvdb_api: for the TVDb and MyAnimeList plugins") 
install=


_gitroot="git://anongit.kde.org/${_appname}"
_gitname=${_appname}

build() {
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd $_appname
  sed -i 's:#!/usr/bin/env python:#!/usr/bin/env python2:' nepomuk-simpleresource-rcgen.py

  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $_appname/build
  make DESTDIR=$pkgdir install

# use python2
  sed -i 's:#!/usr.bin/python:#!/usr/bin/python2:' $pkgdir/usr/share/apps/nepomuk-webminer/plugins/*.py
}
