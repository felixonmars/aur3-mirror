# Contributor: Ray Rashif <schivmeister@gmail.com>

pkgname=jost
pkgver=0.4.6
pkgrel=3
pkgdesc="JACK host for native VST, DSSI and LADSPA plug-ins"
arch=(i686)
url="http://www.anticore.org/jucetice/?page_id=4"
license=('LGPL')
depends=('dssi' 'freetype2' 'libxinerama' 'pth')
makedepends=('ladspa' 'steinberg-vst')
source=(http://www.anticore.org/jucetice/wp-content/uploads/${pkgname}_src-v$pkgver.tar.bz2
	gcc44.patch
	#jostbridge.patch
	$pkgname.desktop)

build() {
  cd "$srcdir/$pkgname-v$pkgver"

  # fails with --as-needed
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"

  # fix building with gcc 4.3
  patch -Np1 -i ../gcc44.patch || return 1

  # x86_64 hack
  #[ -n "${depends[6]}" ] && {
  #  patch -Np0 -i ../${pkgname}-${pkgver}-jostbridge-m64.patch
  #  sed -i 's:#define JOST_USE_JACKBRIDGE         0:#define	JOST_USE_JACKBRIDGE         1:g' \
  #    plugins/Jost/src/Config.h || return 1
  #}

  # we already have vst on our system
  sed -i 's:source/common:vst:g' \
    wrapper/formats/VST/juce_VstWrapper.cpp || return 1

  # to use 2.4 read the file we edited
  #sed -i 's:public.sdk/source/vst2.x:vst24:g' \
  #  wrapper/formats/VST/juce_VstWrapper.cpp || return 1

  # fix unexpected exit returns
  sed -i -e 's:Release &:Release:g' -e 's:Debug &:Debug:g' \
    -e 's:$mode &:$mode:g' shared/compile_jost || return 1

  # build!
  cd shared

  ./configure
  ./compile_libs Release || return 1
  ./compile_jost Release || return 1

  # install
  install -Dm755 ../bin/jost "$pkgdir/usr/bin/$pkgname"
  install -Dm755 ../bin/libjostvst.so "$pkgdir/usr/lib/vst/$pkgname.so"

  install -Dm644 ../plugins/Jost/src/resources/jost.png \
    "$pkgdir/usr/share/pixmaps/jost.png"
  install -Dm644 "$srcdir/jost.desktop" \
    "$pkgdir/usr/share/applications/jost.desktop"
}
md5sums=('2d8e6d86d4b683d29a83e7d5240c2a8e'
         '75d8e51e1c5383d7864998b64598513c'
         '9b669a96925c9a7b8d62ea6e88c06216')
