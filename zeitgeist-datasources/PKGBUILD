# Maintainer: Alexander De Sousa <archaur.xandy21@spamgourmet.com>
# Contributor: Daniele Consonni < b34tslack (at) gmail (dot) com >

pkgname="zeitgeist-datasources"
pkgdesc="Zeitgeist data provider plugins or extensions for several programs."
pkgver=0.8.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://launchpad.net/zeitgeist-datasources"
license=('GPL3')
depends=('libzeitgeist' 'zeitgeist')
conflicts=('zeitgeist-datasources-bzr' 'zeitgeist-dataprovider-firefox')
source=(https://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=("a3cb8a4523912473c2dd0d7a94ad8017")
sha1sums=("8d87ece1e3e834bd329856b69dc0be7478df2e52")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # Move the Chrome extension to the default directory (if it was built):
  if [ -e "$pkgdir/usr/share/opt/google/chrome/resources" ]; then
    install -dm755 "$pkgdir/usr/lib/chromium"
    mv "$pkgdir/usr/share/opt/google/chrome/resources" \
      "$pkgdir/usr/lib/chromium"
    rm -fr "$pkgdir/usr/share/opt/"
    # Those using Chrome instead of Chromium may uncomment these lines:
    #install -dm755 "$pkgdir/opt/chrome/resources"
    #ln -s /usr/share/opt/google/chrome/resources/zeitgeist_plugin \
      #"$pkgdir/opt/chrome/resources"
  fi

  # Do the same for the Bazaar plugin:
  if [ -e "$pkgdir/usr/share/pyshared/bzrlib/" ]; then
    install -dm755 "$pkgdir/usr/lib/python2.7/site-packages/"
    mv "$pkgdir/usr/share/pyshared/bzrlib/" \
      "$pkgdir/usr/lib/python2.7/site-packages/"
    rm -fr "$pkgdir/usr/share/pyshared/bzrlib/"
  fi

  # Remove the Vim plugin, unfortunately the Python interpreter is disabled in
  # our vim package (although not in the gvim one):
  if [ -e "$pkgdir/usr/share/vim/vim72" ]; then
    rm -fr "$pkgdir/usr/share/vim/"
    #mv "$pkgdir/usr/share/vim/vim72" "$pkgdir/usr/share/vim/vim73"
  fi
}

# vim: set ft=sh ts=2 sw=2 et:
