# Contributor: grimi <grimi@poczta.fm>
# Contributor: Tilman Blumenbach <tilman@ax86.net>
#
# NOTES regarding patches:
# - link-to-needed.diff has been removed because reduce-linkage.diff already
#   contains its changes to src/src.pro.

pkgname=lastfm-msk-light
pkgver=1.5.4.26862+dfsg.4a
_dl_pkgver=1.5.4.26862+dfsg
pkgrel=4
pkgdesc="Last.fm client with msk patchset (light version - Debian patches only)"
arch=('i686' 'x86_64')
url="http://www.mehercule.net/staticpages/index.php/lastfm"
license=('GPL')
depends=('libgpod' 'libmad' 'qt>=4.3' 'hicolor-icon-theme' 'which')
makedepends=('patch')
provides=('lastfm-client')
conflicts=('lastfm-client' 'lastfm-msk')
options=(!makeflags)
install=lastfm-msk.install
source=("http://ftp.debian.org/debian/pool/main/l/lastfm/lastfm_${_dl_pkgver}.orig.tar.gz" \
        "http://www.mehercule.net/lastfm/build-fixes.diff" \
        "http://www.mehercule.net/lastfm/reduce-linkage.diff" \
        "http://www.mehercule.net/lastfm/no-fingerprint-lib.diff" \
        "http://www.mehercule.net/lastfm/alsa-uses-qdebug.diff" \
        "http://www.mehercule.net/lastfm/check-soundcard-errors.diff" \
        "http://www.mehercule.net/lastfm/tray-icon-size.diff" \
        "http://www.mehercule.net/lastfm/hide-scrobbledir-option.diff" \
        "http://www.mehercule.net/lastfm/tray-volume.diff" \
        "http://www.mehercule.net/lastfm/set-locale.diff" \
        "http://www.mehercule.net/lastfm/set-firstrun-status.diff" \
        "http://www.mehercule.net/lastfm/qt45.diff" \
        "http://www.mehercule.net/lastfm/qt46.diff" \
        "http://www.mehercule.net/lastfm/qt47.diff" \
        "http://www.mehercule.net/lastfm/dirpaths.diff" \
        "http://www.mehercule.net/lastfm/icons.tar.gz" \
        "http://www.mehercule.net/lastfm/trayicons22.tar.gz" \
        "lastfm.desktop" "lastfm.protocol" "lastfm.sh")

build() {

   cd ${srcdir}/lastfm-${_dl_pkgver}

   local patch
   for patch in "${source[@]}"; do
      if [ `expr "$patch" : '^.\+\.diff$'` -gt 0 ]; then
         local patchfile=`basename "${patch}"`
         msg2 "Applying patch ${patchfile}..."
         patch -Np 1 -i "${srcdir}/${patchfile}" || return 1
      fi
   done

   install -d ${pkgdir}/usr/{bin,share/applications,share/pixmaps,lib}
   install -d ${pkgdir}/usr/share/lastfm/{icons,buttons,i18n,services}
   install -d ${pkgdir}/usr/share/kde4/services
 
   ./configure || return 1
   
   ( cd i18n && lrelease *.ts )

   MAKEFLAGS=-j1 make || return 1

   install -m644 i18n/*.qm ${pkgdir}/usr/share/lastfm/i18n

   install -m644 ${srcdir}/lastfm.protocol ${pkgdir}/usr/share/kde4/services
   install -m644 ${srcdir}/lastfm.desktop ${pkgdir}/usr/share/applications
   
   cd bin

   install -m755 last.fm ${pkgdir}/usr/share/lastfm
   install -m755 "${srcdir}/lastfm.sh" "${pkgdir}/usr/bin/lastfm"

   install -m644 {libLastFmTools.so.1.0.0,libMoose.so.1.0.0} ${pkgdir}/usr/lib
   cp -a libLastFmTools.so libLastFmTools.so.1 libLastFmTools.so.1.0 \
         libMoose.so libMoose.so.1 libMoose.so.1.0 ${pkgdir}/usr/lib

   install -m644 services/* ${pkgdir}/usr/share/lastfm/services
 
   cd data
   install -m644 about_generic.png app_55.png logo.png no*.gif \
                 progress.mng progress_active.mng slider*.png \
                 speaker*.png watermark.png wizard_generic.png \
                 ${pkgdir}/usr/share/lastfm
   
   install -m644 buttons/*.png ${pkgdir}/usr/share/lastfm/buttons
   rm -f icons/*profile24.png
   install -m644 icons/*.png ${pkgdir}/usr/share/lastfm/icons
   install -m644 ${srcdir}/user_*22.png ${pkgdir}/usr/share/lastfm/icons
   
   install -m644 icons/as.png ${pkgdir}/usr/share/pixmaps/lastfm.png   

   cp -a ${srcdir}/icons ${pkgdir}/usr/share/
}

md5sums=('c7991fd2636ca25e68ff476578b506a6'
         '8e03b5cae4df25cbf3fe3715182e025d'
         '9dd13858d170c387281aa2effb9d5c18'
         'd3eafc0a42e6c4795ab224e52afa15fb'
         'd2aabc27ea59f8afc939a7a3018d91bf'
         'a9096239a56bc36aac6fafcd19d312ea'
         '04b0129e637a77d2625981f57f00c9e7'
         '087cff8111dc7b3515009a40e4b1453c'
         'c0f52f311cde53bee1cfbd0517ed99e0'
         'e14aa7c8c2afc02c211e0a5df2c9d494'
         '3253bf7a5a65bce2c7ab95be829c2669'
         '6a43e1d1aef20fe499ef04ffe07e20c3'
         'd56b0b21bb01f0630e792b7498ba2eb5'
         '3c8df40ae1baaf31119d5a555a9aa45c'
         '6410eae80c72645ef5630aee03ce40f2'
         'fb450128e3e759d5ee5db8e2cd5f1d45'
         'ad628454145b87babb8f164ff4b27b9b'
         '12c8246b422a4c4f3d769ba02ef5696a'
         '8d40a2ec0c2d071d53759d1b08a5efb6'
         'c25089833fa41c3d84eb18cc25b6feb5')
