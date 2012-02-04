# Contributor: Andreas Schönfelder <passtschu at freenet dot de>

pkgname=spicebird-i18n
pkgver=0.7.1
pkgrel=3
_languages=ar,ca,cs,da,de,en-GB,es-AR,et,fi,fr,hi-IN,hu,it,ja,nb-NO,nl,pl,pt-BR,pt-PT,ro,ru,sv-SE,te,tr,uk,zh-CN
pkgdesc="Language packs for Spicebird"
arch=('i686' 'x86_64')
url="http://www.spicebird.org/"
license=('GPL' 'LGPL' 'MPL')
depends=("spicebird>=$pkgver")
makedepends=('unzip')
eval source=(http://files.spicebird.org/pub/spicebird.org/spicebird/releases/$pkgver/linux-i686/{`echo "${_languages}" | sed 's|\([-a-zA-Z]*\)|\1/\1|g'`}.xpi)
noextract=($(for i in ${source[@]}; do basename $i; done))
md5sums=('ca19ccd5634bba4c2db4a9db70afce96'
         '305d40728d69bcd9aa6158e21754b32e'
         'e175429c25c8de422dcf41707908f035'
         '51582d1468490c83d52901bab15c2236'
         'c308df0d1d99aaa53d30365716ee70ec'
         'd1b7d5ccf271bceac78201838f04639d'
         'c45beafc2232ea0a52ddeee8d99b0a67'
         'd734f1c7ef441613a84c7e0176476797'
         '4786914a29e903a2583a6120a3633cf4'
         '1b5dc44f5615fc177e533abfb06c99b7'
         '83c0682f5e43172082a7c7d537d3189d'
         'b901b2efd6915b2a14c96fa36f914314'
         'a4f14e04c68932bffd63110072533d05'
         'ed62c8864c885b42201f0be91739ba98'
         '2f1701d7bb24d617909f9e98c6e41818'
         '4c2dda1f67fcfe42b89d31e819189361'
         '0c4c9521aaccd0089a1dd9f885e3fa2e'
         'a9276572ae3a0b0cda1dcb9e185cea98'
         'ebad11e65b21e26a33d72f1263cc98cd'
         '11fa08ed09bae8e39c0291d0de6c50be'
         '5c6c166d7db6f201f1143d79e594ca1d'
         '5ff2cfcc30ddfa84dd8601a204850c24'
         '3c684f2bece03cbf5e7eeb26494f32b4'
         '5746f3997d5049071fcc73db251efcc0'
         '5e928cc4dbfdb79e63dab022958ca186'
         '4a36dc81ead7e8b6fc739ea56b9535ef')

build() {
  cd "$srcdir"
  for lang in $(echo "${_languages}" | sed 's|,| |g'); do
    unzip -o ${lang}.xpi
    sed -i "s|jar:chrome/${lang}.jar|jar:${lang}.jar|" chrome.manifest || return 1
    for file in chrome/*.jar
    do
      install -D -m 644 $file "$pkgdir/usr/lib/spicebird-$pkgver/$file" || return 1
    done
    sed -e 's|chrome/||g' -i chrome.manifest
    install -D -m 644 chrome.manifest "$pkgdir/usr/lib/spicebird-$pkgver/chrome/$lang.manifest" || return 1
  done
}
