# Maintainer: Flow
pkgname=keepass-i18n
pkgver=2.29
pkgrel=1
pkgdesc="Language packs for Keepass"
license=('GPL2')
depends=("keepass")
conflicts=(keepass-de,keepass-fr,keepass-it,keepass-lt,keepass-ru,keepass-zh_cn)
url="http://keepass.info/translations.html"
eval source=("http://downloads.sourceforge.net/keepass/Bulgarian-2.10.zip"
             "http://downloads.sourceforge.net/keepass/Burmese-2.19.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Chinese_Simplified.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Chinese_Traditional.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-2.26-Croatian.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Czech.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Danish.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Dutch.zip"
             "http://downloads.sourceforge.net/keepass/Finnish-2.18.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-French.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-German.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-2.21-Greek.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Hungarian.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-2.23-Indonesian.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Italian.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Japanese.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Korean.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Latin.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Lithuanian.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Norwegian_NB.zip"
             "http://downloads.sourceforge.net/keepass/Persian-2.08.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Polish.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Portuguese_BR.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Portuguese_PT.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-2.22-Romanian.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Russian.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-2.23-Serbian.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Slovak.zip"
             "http://downloads.sourceforge.net/keepass/Slovenian-2.07.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Spanish.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Swedish.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-2.27-Turkish.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Ukrainian.zip"
             "http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Vietnamese.zip")
arch=(any)
md5sums=('26138bb070035de02e04f62ae592e1f3'
         '1d0672b626bc7ba577c5ef40471c6884'
         '1f47e717ff9050da257b4dad5b37af7c'
         '2582995864c36f682adb30c01ee1eb16'
         '0d6628a9974d1e31cae437384b25e661'
         'e1d3c755d89d301feaf1b881257e038b'
         'f75703e8a0bb7f24ccfb3cb034efb6db'
         '4b265474594eac0d3313d79049621a11'
         'dc284751a01eb3e12e7d100e96deed7b'
         '43204029213dee42d2ef82b2332ac5fe'
         '25f7f46997ce7a12c34377c9f8d9b561'
         'b4129b1d4c37fa33d3804a17a7576fad'
         '2a9342924657100e9f53455c61c6cf7e'
         '5de5de415f5d4948a2f132301e49e1a2'
         '5ef106224576d823f3636ed633f10bc3'
         'eec07f9354c47560041b4c93ff218a1d'
         '5d4eb43bce00f3efe5cb4181c0f44f27'
         '8b0a0d045f368a1f09bd452dd7df72b5'
         '18796d380af78202e8af827f0c113864'
         '5d7c39922bb9a612dabad000344b8200'
         '3172ba110fd730ca4c894f9e52f09930'
         'b5fd7de0bb2b3a833b81cda6f28ff1eb'
         '190f87db4ae56c9ee6f67973da90495a'
         '8e18f8ed9ce53c7c8d3326deeda67be9'
         '1d14dda46ccb4f6c921055a58080f0fe'
         'd918572cc34ea670c8386b4fb972d64a'
         'e4b2091d66e182811d3af9bf6d189f31'
         '8b0ac2bd9364dd22a94c03e7711da718'
         'fc2424e22acea3f423dd8b9667bea582'
         'a04c41a2bcb2f3026235f0f2d73dfed2'
         'ec7dafeba161f56221afcf24b7cb13cd'
         '3287c663a431910f54194d1843329376'
         '3dc3f16a897100e782beabaa33182b3d'
         'c96ba09d4508939be336744d2e9751c6')

package(){
  cd ${srcdir}

   install -d "${pkgdir}"/usr/share/keepass
   install -Dm 644 ${srcdir}/*.lngx "${pkgdir}"/usr/share/keepass/
}
