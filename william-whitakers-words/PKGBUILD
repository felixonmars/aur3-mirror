# Maintainer: Mathew Velasquez <01100101z@gmail.com>
pkgname=william-whitakers-words
pkgver=1.97F
pkgrel=1
pkgdesc="An electronic Latin dictionary with about 17,000 entries"
arch=('i686' 'x86_64')
url="http://www.archives.nd.edu/words.htm"
license=('custom')
groups=()
depends=()
makedepends=('gcc-ada')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('http://archives.nd.edu/whitaker/wordsall.zip')
noextract=()
md5sums=('e70ae2112bb7c7c491c3ec7a57af779c')

build() {
  cd "$srcdir"

#Delete some user prompts
  sed -i '/GET_LINE(LINE, LAST);/,+12d' makedict.adb
  sed -i 's/PUT("What dictionary to list.*/D_K := GENERAL;/g' makedict.adb
  sed -i '/Get_Line(Line, Last);/,+12d' makestem.adb
  sed -i 's/Put("What dictionary to load.*/D_K := General;/g' makestem.adb
  sed -i '/GET_LINE(LINE, LAST);/,+13d' makeewds.adb
  sed -i 's/PUT("What dictionary to list.*/D_K := General;/g' makeewds.adb

  echo "Building words..."
  gnatmake -O3 words >/dev/null 2>/dev/null
#  echo "Building makeewds..."
#  gnatmake makeewds >/dev/null 2>/dev/null
  echo "Building makedict..."
  gnatmake makedict >/dev/null 2>/dev/null
  echo "Building makestem..."
  gnatmake makestem >/dev/null 2>/dev/null
  echo "Building makeefil..."
  gnatmake makeefil >/dev/null 2>/dev/null
  echo "Building makeinfl..."
  gnatmake makeinfl >/dev/null 2>/dev/null
#  echo "Building EWDSLIST.GEN..."
#  ./makeewds >/dev/null 2>/dev/null
  echo "Building DICTFILE.GEN..."
  ./makedict >/dev/null 2>/dev/null
  echo "Building STEMFILE.GEN and INDXFILE.GEN..."
  ./makestem >/dev/null 2>/dev/null
  echo "Building EWDSFILE.GEN..."
  ./makeefil >/dev/null 2>/dev/null
  echo "Building INFLECTS.SEC..."
  ./makeinfl >/dev/null 2>/dev/null
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin/" "$pkgdir/usr/lib/words/"

  echo -e "#!/bin/sh\ncd /usr/lib/words\n./words" > "$pkgdir/usr/bin/words"
  chmod +x "$pkgdir/usr/bin/words"

  mv words "$pkgdir/usr/lib/words/"
  mv DICTFILE.GEN EWDSFILE.GEN INDXFILE.GEN STEMFILE.GEN "$pkgdir/usr/lib/words/"
  mv ADDONS.LAT UNIQUES.LAT INFLECTS.SEC "$pkgdir/usr/lib/words/"
}
