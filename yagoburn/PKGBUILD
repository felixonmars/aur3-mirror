# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Sayan "Riju" Chakrabarti <me@sayanriju.co.cc>
pkgname=yagoburn
pkgver=1.0beta
_srcver=1.0-BETA
pkgrel=1
pkgdesc="Yet Another Gui Optical BURNer"
arch=(i686 x86_64)
url="http://code.google.com/p/yagoburn/"
license=('GPL3')
groups=()
depends=('wxpython>=2.8.1' 'python>=2.6.2' 'cdrkit' 'dvd+rw-tools')
makedepends=()
optdepends=('libnotify: for using notify-send to show desktop notifications on success/failure')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://yagoburn.googlecode.com/files/$pkgname-$_srcver.tar.gz)
noextract=()
md5sums=('f0a2d31240408c6f7f30a10c3f4afa47') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname"
  mkdir -p ${startdir}/pkg/usr/share/{${pkgname},doc/${pkgname}}
  cp -r {yagoburn,customwidgets,functions}.py icons ${startdir}/pkg/usr/share/${pkgname}/
  cp {README,VERSION,COPYING} ${startdir}/pkg/usr/share/doc/${pkgname}/
  echo "cd /usr/share/yagoburn && python2 yagoburn.py" > yagoburn
  install -Dm 755 yagoburn ${startdir}/pkg/usr/bin/yagoburn
## sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' ${startdir}/pkg/usr/bin/yagoburn
}
