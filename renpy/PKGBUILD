# Maintainer: AlexanderR <rvacheva at nxt dot ru>
pkgname=renpy
pkgver=6.17.6
pkgrel=1
pkgdesc="Ren'Py is a visual novel engine that helps you use words, images, and sounds to tell stories with the computer. This package contains both player and development tools."
arch=('any')
license=('MIT')
url='http://www.renpy.org'
# is ttf-dejavu required by renpy or games itself?
depends=("python-renpy=$pkgver" 'ttf-dejavu')
optdepends=('tk: file selection dialog in sdk'
	    'jedit: previously recommended editor for Python files')
options=(!strip !zipman)
conflicts=('renpy-bin' 'renpy64' 'renpy-allinone')
replaces=('renpy64')
install=renpy.install
source=("http://www.renpy.org/dl/$pkgver/renpy-$pkgver-source.tar.bz2"
	"${pkgname}.desktop"
	"${pkgname}."{sh,csh}
	'renpy-launcher.sh')

md5sums=('ca600e9b346b9bd200844234eaf49049'
         'a9beb35fa6c6d8af7ba5d2a764c33158'
         'd206d24b78e207a2c3b603fef14ac47f'
         '8b9922e26e567248a2a5adc1d0cdfdd4'
         'dfa92cdecc15e5c1ddee387fbbbb2d9c')

build() {
  cd "$srcdir/renpy-$pkgver-source"

  # fonts are provided by ttf-dejavu
  cd renpy
  rm common/DejaVuSans.ttf common/DejaVuSans.txt
}

package(){
  mkdir -p "$pkgdir/"{usr/share/{$pkgname,doc/$pkgname},etc/profile.d}

  cd "$srcdir"

  install -m755 ${pkgname}.{sh,csh} "$pkgdir/etc/profile.d"
  install -D -m755 $pkgname-launcher.sh "$pkgdir/usr/bin/$pkgname"
  install -D -m644 ${pkgname}.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"

  cd renpy-$pkgver-source

  cp -r launcher renpy renpy.py renpy/common templates the_question tutorial "$pkgdir/usr/share/$pkgname"
  cp -r doc/* "$pkgdir/usr/share/doc/$pkgname"
  install -D -m644 launcher/game/images/logo32.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -D -m644 'LICENSE.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  chgrp -R games "$pkgdir"/usr/share/renpy/{the_question,tutorial}
  chmod g+w "$pkgdir"/usr/share/renpy/{the_question,tutorial}
}
