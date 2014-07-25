# Maintainer: Daniel Landau <daniel.landau@iki.fi>
# Contributor: Xyne
# Contributor: David Manouchehri <d@32t.ca>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Thomas Jost <schnouki schnouki net>
# Contributor: Hinrich Harms <arch hinrich de>

# the PKGBUILD lives in https://github.com/daniellandau/AUR-thunderbird-enigmail
# pull requests are welcome

pkgname=thunderbird-enigmail
pkgver=1.7
pkgrel=2
pkgdesc="Thunderbird extension that enables sending and receiving signed and encrypted e-mail messages"
arch=('i686' 'x86_64')
url="https://www.enigmail.net/"
license=('MPL' 'GPL')
depends=('thunderbird' 'gnupg')
makedepends=('zip' 'unzip' 'python2' 'perl>=5.8')
source=("https://www.enigmail.net/download/source/enigmail-${pkgver}.tar.gz"{,.asc}) # gpg --recv-keys E443D6D8
sha256sums=('cddbf35783194a4e994f9584ad5bee74750e25f690e81727ba9eccc4f814f161'
            'SKIP')

build() {
  cd "$srcdir/enigmail"
  PYTHON=/usr/bin/python2 ./configure
  make -j1 # fails with -j greater than 1
}

package() {
  cd "$srcdir/enigmail"
  emid="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' package/install.rdf)"
  install -d -m755 "$pkgdir"/usr/lib/thunderbird/extensions/"$emid"
  cd "$pkgdir"/usr/lib/thunderbird/extensions/"$emid"
  unzip "$srcdir"/enigmail/build/enigmail-*.xpi

  # Uncomment the following lines if you use thunderbird-nightly
  # install -d -m755 "$pkgdir"/opt/thunderbird-nightly-*/extensions/"$emid"
  # cd "$pkgdir"/opt/thunderbird-nightly-*/extensions/"$emid"
  # unzip "$srcdir"/enigmail/build/enigmail-*.xpi
}
