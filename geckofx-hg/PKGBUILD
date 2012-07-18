pkgname=geckofx-hg
pkgver=596
pkgrel=1
pkgdesc="GeckoFX is a cross platform Webrowser control for embedding into WinForms Applications. (hg)"
url="https://bitbucket.org/geckofx"
arch=(any)
license=("MPL 1.1")
depends=(gtk-sharp-2 mono)
makedepends=(mono mercurial)
options=(!strip)
_hgroot=$url
_hgrepo="geckofx-14.0"

build() {
  cd $srcdir
  msg "Connecting to hg server..."
  if [[ -d "$_hgrepo/.hg" ]]; then
    msg "pull"
    ( cd $_hgrepo && hg pull -u )
  else
    msg "clone"
    hg clone "${_hgroot}/${_hgrepo}"
  fi
  cd "${_hgrepo}"

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_hgrepo}-build"
  cp -r "${srcdir}/${_hgrepo}" "${srcdir}/${_hgrepo}-build"
  cd "${srcdir}/${_hgrepo}-build/Skybound.Gecko"
  xbuild Skybound.Gecko.sln
}

package() {
  cd "$srcdir/${_hgrepo}-build/Skybound.Gecko/bin/x86/Debug_Linux"
  install -Dm644 geckofx-14.dll "$pkgdir/usr/lib/GeckoFX/geckofx-14.dll"
  install -Dm644 geckofx-14.dll.config "$pkgdir/usr/lib/GeckoFX/geckofx-14.dll.config"
  gacutil -i geckofx-14.dll -root "$pkgdir/usr/lib"
}
