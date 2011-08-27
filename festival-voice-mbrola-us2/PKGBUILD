# Contributor: Your Name <michal.bozon__at__gmail.com>
pkgname=festival-voice-mbrola-us2
pkgver=1.96
pkgrel=1
pkgdesc="MBROLA us2 voice wrapper for Festival"
arch=(i686 x86_64)
url="http://festvox.org/packed/festival/latest/"
license=(custom)
depends=(mbrola-voices-us2)
source=(http://www.festvox.org/packed/festival/$pkgver/festvox_us2.tar.gz)
md5sums=('fbcc8baacbff3aa2aaaf5a93701bb5e0')

build() {
  cd "$srcdir"/festival/lib/voices/english
  _destdir="$pkgdir"/usr/share/festival/voices/english
  mkdir -p -m 755 "$_destdir"
  cp -r us2_mbrola "$_destdir"

  # link directory from dependency package
  ln -s /usr/share/mbrola/us2 "$_destdir"/us2_mbrola/us2

  # extract license
  _licfile="us2_mbrola/festvox/us2_mbrola.scm"
  _licdir="$pkgdir"/usr/share/licenses/$pkgname
  _startline=2
  _endline=31
  mkdir -p -m 755 "$_licdir"
  cat $_licfile | \
    head -n $_endline | tail -n $(($_endline - $_startline + 1)) | \
    sed -r 's/;{2,}//g' > "$_licdir"/LICENSE
  chmod 644 "$_licdir"/LICENSE
}

# vim:set ts=2 sw=2 et:
