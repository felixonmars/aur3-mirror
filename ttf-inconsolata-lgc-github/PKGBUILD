# Maintainer: Renat Nasridinov <mavladi at gmail dot com>

pkgname=ttf-inconsolata-lgc-github
pkgver=20130921
pkgrel=1
pkgdesc="A modified version of Inconsolata with the Cyrillic alphabet."
arch=('any')
url='https://github.com/DeLaGuardo/Inconsolata-LGC.git'
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
install=${pkgname}.install
source=('LICENSE')
md5sums=('5f8bfb6bba8cd6b4388758801e92fd26')

_gitroot='https://github.com/DeLaGuardo/Inconsolata-LGC.git'
_gitname='Inconsolata-LGC'

build() {
   cd "$srcdir"

   msg "Connecting to GIT server..."

   if [ -d "${srcdir}/${_gitname}" ]; then
      cd "$_gitname" && git pull origin
      cd "$srcdir"
      msg "The local files are updated."
   else
      git clone --depth=1 "$_gitroot" "$_gitname"
   fi

   msg "GIT checkout done or server timeout"
}

package() {
   cd "${srcdir}/${_gitname}/"

   install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
   install -m644 -t "$pkgdir/usr/share/licenses/$pkgname" $srcdir/LICENSE

   local font='inconsolatalgc.ttf'
   install -Dm755 "$font" "${pkgdir}/usr/share/fonts/TTF/$font"
}
