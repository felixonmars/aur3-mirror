# Maintainer: Jeremy Sands <cto@jeremysands.com>
# Contributor: William Rea <sillywilly@gmail.com>
#
# Since gcc-gcj is in AUR and "needs updating..." trying to build this from scratch is insanity.
#

pkgname=python-pylucene
pkgver=2.3.1
pkgrel=2
_pkgrel=1.1+b1
pkgdesc="Use Lucene's text indexing and searching capabilities for Python"
url="http://lucene.apache.org/pylucene/"
arch=('i686' 'x86_64')
license="MIT"
depends=('python' 'openjdk6')
makedepends=('deb2targz')
provides=('python-pylucene')
if [ ${CARCH} = 'x86_64' ]; then
  source=(http://ftp.us.debian.org/debian/pool/main/p/pylucene/pylucene_"$pkgver"-"$_pkgrel"_amd64.deb)
  md5sums=('cf2600db451739e490b7e887f00350af')
elif [ ${CARCH} = 'i686' ]; then
  source=(http://ftp.us.debian.org/debian/pool/main/p/pylucene/pylucene_"$pkgver"-"$_pkgrel"_i386.deb)
  md5sums=('774742bd6595da9ce499bc5ef17b86c6')
fi

build() {
  cd "$startdir"/src/
  mv * "$startdir"/pkg/
  cd "$startdir"/pkg/
  if [ ${CARCH} = 'x86_64' ]; then
    deb2targz pylucene_"$pkgver"-"$_pkgrel"_amd64.deb || return 1
    gzip --decompress pylucene_"$pkgver"-"$_pkgrel"_amd64.tar.gz || return 1
    tar -xvf pylucene_"$pkgver"-"$_pkgrel"_amd64.tar || return 1
  elif [ ${CARCH} = 'i686' ]; then
    deb2targz pylucene_"$pkgver"-"$_pkgrel"_i386.deb || return 1
    gzip --decompress pylucene_"$pkgver"-"$_pkgrel"_i386.tar.gz || return 1
    tar -xvf pylucene_"$pkgver"-"$_pkgrel"_i386.tar || return 1
  fi
  # Unnecessary empty Debian crap
  rm -rf "$startdir"/pkg/etc
}
