# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>

_pkgname=zotero
pkgname=zotero-git
pkgver=1365052712
pkgrel=1
pkgdesc='Zotero Standalone'
arch=('i686' 'x86_64')
url='http://www.zotero.org/'
license=('GPL3')
makedepends=('git' 'zip')
provides=('zotero')
conflicts=('zotero')
install="$_pkgname.install"
source=(
  "$_pkgname::git+https://github.com/zotero/zotero-standalone-build#branch=master"
  "$_pkgname.desktop"
)
sha512sums=(
  'SKIP'
  '9b522739e55dac64731f8cfc96e8e7784178f68430306b2f01ff39315214fd85bbbce2e55581028105f0da097570d76c0673b058f14e468cb0b79ae3cb18a997'
)

pkgver() {
  cd "$_pkgname"
  git log -n1 --pretty=format:%ct
}

prepare() {
  cd "$_pkgname"
  sed -i -e 's|BUILD_MAC=1|BUILD_MAC=0|g;s|BUILD_WIN32=1|BUILD_WIN32=0|g' ./config.sh
  sed -i -e 's|MOZ_PROGRAM=""|MOZ_PROGRAM="/usr/lib/zotero/zotero"|g' "$srcdir/$_pkgname/linux/run-zotero.sh"
}

build() {
  cd "$srcdir/$_pkgname"
  ./fetch_xulrunner.sh
  ./build.sh
}

package() {
  mkdir -p -- "$pkgdir"/usr/{bin,lib/zotero}
  cp -Rt "$pkgdir/usr/lib/zotero" -- "$srcdir/$_pkgname/xulrunner/xulrunner_linux-$CARCH/"*
  install -Dm755 "$srcdir/$_pkgname/linux/run-zotero.sh" "$pkgdir/usr/lib/zotero/run-zotero.sh"
  install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$pkgdir/usr/lib/zotero/chrome/icons/default/default48.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  ln -Ts /usr/lib/zotero/run-zotero.sh "$pkgdir"/usr/bin/zotero
}
