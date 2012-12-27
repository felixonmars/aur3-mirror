# Maintainer: Adrian Chaves Fernandez (Gallaecio) <adriyetichaves@gmail.com>

pkgname=hunspell-gl-git
_pkgname=hunspell-gl
pkgver=20121227
pkgrel=1
pkgdesc="Galician spellchecker for Hunspell"
arch=('any')
url="http://trasno.net/"
license=('GPL3')
depends=('hunspell')
makedepends=('git')
provides=('hunspell-gl')
conflicts=('hunspell-gl')

_gitroot=git://github.com/meixome/$_pkgname.git
_gitname=$_pkgname

lang="gl"
lang2="gl_ES"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  scons code=$lang
}

package() {
  cd "$srcdir/$_gitname-build/build"
  
  install -d $pkgdir/usr/share/{hunspell,myspell/dicts,enchant}
    
  # Actual installation...
  install -Dm644 $lang.aff	"$pkgdir/usr/share/hunspell/$lang.aff"
  install -Dm644 $lang.dic	"$pkgdir/usr/share/hunspell/$lang.dic"

  # Locale aliases.
  pushd $pkgdir/usr/share/hunspell
    ln -s $lang.aff $lang2.aff
    ln -s $lang.dic $lang2.dic
  popd

  # Myspell aliases.
  pushd ${pkgdir}/usr/share/myspell/dicts
    for file in ${pkgdir}/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename ${file}) .
    done
  popd

  # Enchant aliases.
  ln -s /usr/share/hunspell $pkgdir/usr/share/enchant/hunspell
}