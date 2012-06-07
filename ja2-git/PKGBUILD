# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Christoph Zeiler <rabyteNOSPAM_at_moonblade.dot.org>
# Contributor: Xemertix <arch88(at)katamail(dot)com>
# Contributor: drm <jasmintee AT gmx DOT de>

pkgname=ja2-git
pkgver=1
pkgrel=2
pkgdesc="A port of Jagged Alliance 2 to SDL. Continued Development on GitHub of Trons last SVN revision '7072'."
arch=('i686' 'x86_64')
url="https://github.com/misanthropos/ja2"
license=('custom')
makedepende=('git')
depends=('gcc-libs' 'sdl')
install=ja2.install
source=('ja2.png' 'ja2.desktop')
provides=('ja2')
conflicts=('ja2')
md5sums=('e793ae54bbe8874efc9205280281454f'
         '1f438b07138232399a493db93a02cae9')

_gitname="ja2"
_gitroot="git://github.com/misanthropos/ja2.git"
build() {

  cd ${srcdir}
  msg "Connecting to GIT server ..."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  mkdir -p "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}" && ls -A | grep -v .git | xargs -d '\n' cp -r -t ../${_gitname}-build # do not copy over the .git folder
  cd ${srcdir}/${_gitname}-build

  # make and install
  echo -e "Language of your game files? DUTCH, ENGLISH, FRENCH, GERMAN, ITALIAN,\n\
  POLISH, RUSSIAN, RUSSIAN_GOLD"
  read LNG
  export LNG
  make || return 1
  make \
    PREFIX="$pkgdir"/usr \
    MANPREFIX="$pkgdir"/usr/share \
  install || return 1

  # remove .ico file
  rm -f "$pkgdir"/usr/share/pixmaps/jagged2.ico
  rm -f "$pkgdir"/usr/share/applications/ja2-stracciatella.desktop

  # install license
  install -Dm644 "SFI Source Code license agreement.txt" \
    "$pkgdir"/usr/share/licenses/$pkgname/COPYING

  # install icon
  install -Dm644 ../ja2.png "$pkgdir"/usr/share/pixmaps/ja2.png
  install -Dm644 ../ja2.desktop "$pkgdir"/usr/share/applications/ja2.desktop
}
