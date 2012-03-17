#Maintainer: Loren Copeland <thisisquitealongname at gm--l> 

pkgname=vst-juced-svn
pkgver=177
pkgrel=1
pkgdesc="Juced svn repository. Linux-VST plugins and standalone apps. Jost, Jost as a VST, Jacked, Eqinox 6-band EQ VST, Bitmangler & VST, Nekobee & VST, Peggy2000 synth & VST, Soundcrab & VST..."
arch=('i686' 'x86_64')
url="http://code.google.com/p/juced"
license=('custom')
depends=('alsa-lib' 'jack' 'freetype2' 'libxinerama') 
makedepends=('subversion')
optdepends=()
provides=('jost' 'nekobee')
conflicts=()
source=("vst_sdk2_4_rev2.zip"
		"manage.patch"
		"manage-nodebug.patch")

_svntrunk=http://juced.googlecode.com/svn/trunk/
_svnmod=juced

build() {
  cd "${srcdir}"

  if [ -d "${_svnmod}/.svn" ]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_svnmod}-build"
  cp -r "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cp -r "${srcdir}/vstsdk2.4/" "${srcdir}/${_svnmod}-build/vst/"

  cd "${srcdir}/${_svnmod}-build/tools/linux"

## Comment this line for additional debuggable builds:
  patch manage "${srcdir}/manage-nodebug.patch"

  patch manage "${srcdir}/manage.patch"

  sed -i 's/-Wall -fPIC/-Wall -fPIC -fpermissive -fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2/' premake.lua
  sed -i 's/make CONFIG/LDFLAGS+="-lasound -ldl -lfreetype -lpthread -lX11 -lXinerama" make CONFIG/' manage

  export root_directory="${srcdir}/${_svnmod}-build/" \
	tools_directory="${srcdir}/${_svnmod}-build/tools/linux" \
	juce_directory="${srcdir}/${_svnmod}-build/juce" \
	apps_directory="${srcdir}/${_svnmod}-build/apps" \
	wrapper_directory="${srcdir}/${_svnmod}-build/juce/extras/audio plugins/wrapper"

  ./manage make all
}

package() {
  cd "${srcdir}/${_svnmod}-build/bin"

# Clean out the broken / incomplete stuff:
#  rm analyzervst* \
#  capsaicin* \
#  drumsynth* \
#  dubdelay.so \
#  helix* \
#  implzr.so \
#  kombat* \
#  monitor* \
#  notemap* \
#  tal-filter \
#  vex*

## If you're making debuggables too, these will probably make ardour choke:
#  rm dubdelay_debug.so \
#  	implzr_debug.so \
#  	tal-filtervst_debug.so

  
  mkdir -p "${pkgdir}/usr/lib/vst"
  cp bitmanglervst.so \
	eqinoxvst.so \
	jostvst.so \
	nekobeevst.so \
	peggy2000vst.so \
	soundcrabvst.so \
	tal-filtervst.so \
	tal-reverbvst.so \
	"${pkgdir}/usr/lib/vst"

  cp wolpertingervst.so "${pkgdir}/usr/lib/vst/wolpertingervst-0.1.so"

  mkdir -p "${pkgdir}/usr/bin"

  cp wolpertinger "${pkgdir}/usr/bin/wolpertinger-0.1"

  cp analyzer \
	bitmangler \
	dubdelay \
	eqinox \
	implzr \
	jacked \
	jost \
	nekobee \
	peggy2000 \
	soundcrab \
	tal-reverb \
	"${pkgdir}/usr/bin/"

### Debug

#  cp bitmanglervst_debug.so \
#    eqinoxvst_debug.so \
#    jostvst_debug.so \
#    nekobeevst_debug.so \
#    peggy2000vst_debug.so \
#    soundcrabvst_debug.so \
#    tal-filtervst_debug.so \
#    tal-reverbvst_debug.so \
#    "${pkgdir}/usr/lib/vst"

#  cp analyzer_debug \
#	bitmangler_debug \
#	dubdelay_debug \
#	eqinox_debug \
#	implzr_debug \
#	jacked_debug \
#	jost_debug \
#	nekobee_debug \
#	peggy2000_debug \
#	soundcrab_debug \
#	tal-reverb_debug \
#	"${pkgdir}/usr/bin/"

## (Probably not necessary to have a debug copy of wolpertinger, since this looks like an old version.)

}

# vim:set ts=2 sw=2 et:
md5sums=('b4b496306a95e422ccffd0e73b87a870'
         '72cdeacbd3e5175704e242d6d45c3fce'
         '4ceea0ef2ed06396f486ad4b68b6fb47')
