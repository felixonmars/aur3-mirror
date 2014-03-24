# Maintainer: 404
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Vitaly Bogdanov <vsbogd at gmail dot com>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>

pkgname=bubbros
pkgver=1.6.2
pkgrel=2
pkgdesc="Bubble Bobble clone for up to 10 players"
arch=('i686' 'x86_64')
license=('MIT')
url="http://bub-n-bros.sourceforge.net"
depends=('python2' 'libxext')
optdepends=('python2-pygame: alternative frontend for client'
            'pygtk: alternative frontend for client'
            'java-environment: alternative frontend for client')
install=bubbros.install
source=("http://downloads.sourceforge.net/bub-n-bros/bubbros-$pkgver.tar.gz"
        "bubbros-config-in-home.patch"
        "bubbros-use-python2.patch"
        "bubbros.desktop")
sha256sums=('0ad8a359c4632071a9c85c2684bae32aa0fa278632c49f092dc4078cfb9858c4'
            '6331c308c0db4fed129e765a26cb1f0da9219e7d5626ed8144d28f2456a011e8'
            '5f958f3b09069af5f5ce75b15793d87c53f606b3ea99ded71542d2274546dc82'
            'e201381b0e542996bc503a519071ff79db77ce63aaba7f32ca508b67899f56a5')

prepare() {
  # save to home folder
  patch -Np0 < bubbros-config-in-home.patch
  # use python2
  patch -Np0 < bubbros-use-python2.patch
}

build() {
  cd bubbros-$pkgver

  # build extensions and doc
  make all docs -j1
  # generate images with different colors from palette
  python2 bubbob/images/buildcolors.py
}

package() {
  cd bubbros-$pkgver

  # data
  install -d "$pkgdir"/usr/{bin,share/man/man1}
  install -Dm755 BubBob.py "$pkgdir"/usr/share/bubbros/BubBob.py
  cp -r bubbob common display java http2 metaserver "$pkgdir"/usr/share/bubbros
  # permissions
  chmod 755 "$pkgdir"/usr/share/bubbros/display/Client.py
  # symlinks
  ln -s /usr/share/bubbros/BubBob.py "$pkgdir"/usr/bin/bubbros
  ln -s /usr/share/bubbros/display/Client.py "$pkgdir"/usr/bin/bubnbros-client
  ln -s /usr/share/bubbros/bubbob/bb.py "$pkgdir"/usr/bin/bubnbros-server
  # manual
  install -m644 doc/*.gz "$pkgdir"/usr/share/man/man1
  # license
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/bubbros/LICENSE
  # .desktop entry
  install -Dm644 ../bubbros.desktop "$pkgdir"/usr/share/applications/bubbros.desktop
  install -Dm644 http2/data/bob.png "$pkgdir"/usr/share/pixmaps/bubbros.png

  # remove not needed stuff
  find "$pkgdir"/usr/share/bubbros \( \
      \( -type d -and \( -name build -or -name CVS \) \) -or \
      \( -type f -and \( -name .cvsignore -or -name Makefile -or -name "*.c" \) \) \
    \) -exec rm -r {} \+
  rm -r "$pkgdir"/usr/share/bubbros/display/windows
}
