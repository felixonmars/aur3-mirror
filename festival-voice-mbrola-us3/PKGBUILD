# Contributor: Your Name <michal.bozon__at__gmail.com>
pkgname=festival-voice-mbrola-us3
pkgver=1.96
pkgrel=1
pkgdesc="MBROLA us3 voice wrapper for Festival"
arch=(i686 x86_64)
url="http://festvox.org/packed/festival/latest/"
license=(custom)
# groups=()
depends=(mbrola-voices-us3)
source=(http://www.festvox.org/packed/festival/$pkgver/festvox_us3.tar.gz)
md5sums=('06dbfe2edaab6ffa31deeaf522e0c33e')

build() {
  cd "$srcdir"/festival/lib/voices/english
  _destdir="$pkgdir"/usr/share/festival/voices/english
  mkdir -p -m 755 "$_destdir"
  cp -r us3_mbrola "$_destdir"

  # link directory from dependency package
  ln -s /usr/share/mbrola/us3 "$_destdir"/us3_mbrola/us3

  # extract license
  _licfile="us3_mbrola/festvox/us3_mbrola.scm"
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
