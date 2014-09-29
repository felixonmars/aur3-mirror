# Maintainer: cjh <nunki3343 at gmail dot com>
# Contributor: 
_pkgname=juce
pkgname=${_pkgname}-git
pkgver=0
pkgrel=1
pkgdesc="Jules Utility Class Extensions is a Cross Platform C++ Toolkit"
arch=('i686' 'x86_64')
url="https://github.com/julianstorer"
license=('GPL')
makedepends=('git')
depends=('mesa' 'freetype2' 'alsa-lib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("$_pkgname::git://github.com/julianstorer/JUCE.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}

build() {
  
  # IntroJucer
  cd "$srcdir/$_pkgname/extras/Introjucer/Builds/Linux/"
  make CONFIG=Release

  # Demo
  cd "$srcdir/$_pkgname/extras/Demo/Builds/Linux/"
  make CONFIG=Release
}


package() {
  cd "$srcdir/$_pkgname"
  
  # IntroJucer
  install -Dm755 "$srcdir/$_pkgname/extras/Introjucer/Builds/Linux/build/Introjucer" \
  "$pkgdir/usr/bin/Introjucer"
  cd "$srcdir/$_pkgname/extras/Introjucer/Builds/Linux" && make clean
  # Demo
  install -Dm755 "$srcdir/$_pkgname/extras/Demo/Builds/Linux/build/JuceDemo" \
  "$pkgdir/usr/bin/JuceDemo"
  cd "$srcdir/$_pkgname/extras/Demo/Builds/Linux" && make clean

  cd "$srcdir/$_pkgname"
  
  # library files
  install -d "$pkgdir/usr/include/$pkgname"
  find . -type f \
	-not -path "./docs/*" \
	-not -path "./.git*" \
	-not -path "./extras/*" \
    -print0 | while IFS= read -r -d '' file; do
		sed -i 's///g' "$file"
		install -Dm644 "$file" \
		"$pkgdir/usr/include/$pkgname/$file"
  done

  # extras
  install -d "$pkgdir/usr/share/$pkgname"
  find extras -type f \
	-not -name "*.o" \
	-not -name "*.d" \
    -print0 | while IFS= read -r -d '' file; do
		sed -i 's///g' "$file"
		install -Dm644 "$file" \
		"$pkgdir/usr/share/$pkgname/$file"
  done

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -a docs/* "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -Dm644 "$srcdir/$_pkgname/docs/gpl.txt" \
  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
