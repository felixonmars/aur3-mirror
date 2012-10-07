# Maintainer: Paul Feitzinger <paul at pfeyz dot com>

pkgname=childes-clan
pkgver=latest
pkgrel=1
pkgdesc='Computerized Language ANalysis. Tools for analyzing CHILDES transcripts.'
arch=('i686' 'x86_64')
url='http://childes.psy.cmu.edu/'
license=('GPL')
if test "$CARCH" == x86_64; then
  depends=('lib32-gcc-libs')
else
  depends=('gcc-libs')
fi
source=('childes-clan.sh')
md5sums=('8c37ea3b87d4c5a050a2551ff4af09dc')

_sourceurl='http://childes.psy.cmu.edu/clan/unix-clan.tgz'

build(){
  cd $srcdir
  echo "Downloading sources from $_sourceurl"
  wget $_sourceurl
  tar -xzf unix-clan.tgz
  cd unix-clan/src
  sed -i 's@#define DEPDIR  "../lib/"@#define DEPDIR "/opt/clan/lib/"@' \
    common.h
  if test "$CARCH" == x86_64; then
    make CC=g++ CFLAGS="-DUNX -Wno-deprecated -Wno-deprecated-declarations -m32"
  else
    make CC=g++ CFLAGS="-DUNX -Wno-deprecated -Wno-deprecated-declarations"
  fi
}

package() {
  install -d $pkgdir/opt/clan
  cp -r $srcdir/unix-clan/unix/bin $pkgdir/opt/clan/
  cp -r $srcdir/unix-clan/lib $pkgdir/opt/clan/
  chmod -R 755 $pkgdir/opt/clan/
  install -Dm775 childes-clan.sh $pkgdir/etc/profile.d/childes-clan.sh
  install -Dm775 $srcdir/unix-clan/src/gpl.txt $pkgdir/usr/share/licenses/childes-clan/gpl.txt
}
