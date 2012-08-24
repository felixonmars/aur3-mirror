# Maintainer: Figue <ffigue@gmail.com>
# Based on firefox-i18n package

pkgname=icecat-i18n
pkgver=14.0
ffver=14.0.1
pkgrel=1
pkgdesc="Language packs for IceCat"
arch=('any')
license=('MPL')
url="http://www.gnu.org/software/gnuzilla/"
depends=("icecat>=${pkgver}")
#_url=http://gnuzilla.gnu.org/download/langpacks/${pkgver}/GNU_IceCat-${pkgver}
_url=http://mirror.lnx.im/icecat/langpacks/${ffver}/
source=(${_url}{af,ak,ar,ast,be,bg,bn-BD,bn-IN,br,bs,ca,cs,cy,da,de,el,en-GB,en-US,en-ZA,eo,es-AR,es-CL,es-ES,es-MX,et,eu,fa,fi,fr,fy-NL,ga-IE,gd,gl,gu-IN,he,hi-IN,hr,hu,hy-AM,id,is,it,ja,kk,kn,ko,ku,lg,lt,lv,mai,mk,ml,mr,nb-NO,nl,nn-NO,nso,or,pa-IN,pl,pt-BR,pt-PT,rm,ro,ru,si,sk,sl,son,sq,sr,sv-SE,ta-LK,ta,te,th,tr,uk,vi,zh-CN,zh-TW,zu}.xpi)

# Don't extract anything
noextract=(${source[@]##*/})

build() {
  cd "${srcdir}"
  for langfile in *.xpi; do
    install -D -m 644 ${langfile} "${pkgdir}/usr/lib/icecat/extensions/langpack-${langfile}@firefox.mozilla.org.xpi"
  done
}

md5sums=('2b76921a7205fc9fff90f7a80097cc5c'
         'c0dcdc7666065ba5847d63b3e909740f'
         'cea2aeede2054321da84f07916e192a5'
         'a630e70f4da06ad3f20d285d8d562a04'
         '47400999ff79824dace4594757784f54'
         'a0a5b8a31f1295307d1017035d95c3c2'
         'ee02e8f6c1c43c491b741dfd996c406a'
         '4d9c3a27f94c9ea99b70da7213a1379a'
         '06c3a67a2329a1081ce753a876f2e72f'
         '266e386e4c77e5bbe26c104a3bf52177'
         '721ec1c12075158c46d4a38f508b5b15'
         'fa0ba5b2bc1228c1205738a2c691ddda'
         'd91728087c7da7a8a220a14188aecb5b'
         '0785e204f38423022b840265aaed851c'
         'e395489982604d6385d8cb34915673da'
         '40a09a4a9fca6bddcfbe17a49a86024e'
         'a5bc886e410fe80d25b45cfddf247a03'
         '27d93b504f8d589cb663c246c51196c8'
         '38d00a5d44bc61cf82e5ea357676ae6a'
         '7b28428597d65a3edfe43ac12d22fdd1'
         '8aa86e923c9461c22a7b273296d9ed27'
         'd4663951a85edce79ef05e95d3b65966'
         '14152c00b5400f74375b4ed96012a2a5'
         'f3c3f400f951fbc120b3aa632255d81b'
         'ad713820a21b758b9a8e48fe6e8252b2'
         'a657d3741e35c91cb12beb252d4ff34a'
         '07b6a1803aa39004d2faae7f01e8c125'
         'be12ebb7fac79835198b0b3d02947457'
         '380063aeec77449bb3a1520ecfb4d4de'
         '93024ca1c81a668f704c614fe79e5b84'
         'e6bbc5d177c931cadc50c2ad950e3303'
         'cec0e96ce427ddb318094ab697ac6155'
         '6f1f1b1cee2140ed0e6f7b75f717c745'
         '1fa5adbea903ca15080bcab78ee12767'
         '83d1c3e9e802e22fb4cc67ff241e6698'
         'a13080558354787262dbbe647662fd71'
         '54d83c3942abbc071720046f2a8ede14'
         '993ab15c8a8a5a4ee6d547584dbcd356'
         'f90d4fd1485a2b714007e05852056802'
         'a4414e87ecd406f30a6055ecec6fba49'
         '8783abad9a9cb074d5271d7e2c7104c9'
         '558c3d359967db47163beebfe59226f2'
         'e8eb0686a41cc7ea6276d3b95258f4d3'
         '0d78179ec99bdb64c92ffcfe9d6a4844'
         'd56e567e97bd0d5c37d4b444bee1cbff'
         'a795aee10bdba0a35c64960ef8675f8e'
         '254dd57e501c527544d6d71228c1ecc8'
         '19e4a1106be5f78600f8f7ef30b2e8dd'
         'bf15c79e00c0dfcdb0d93371b70ffd7e'
         '3b2c9edc9f7687f67ded5ef0ad66533e'
         '57b964f16f5b2aab38d84d9b06d2a0f9'
         '649c7fc99f6f47e38ff3ba03dc311350'
         '0a88409e9d6369c0392604abf6f98d67'
         '2c508f147e2817688064d3510f374850'
         '65311c0285a74139e814ca4f2452e410'
         '1919114610066afb79109c87cddfd433'
         '8da8e80b9a63b265e89bf4d363a717bc'
         '99ad0e31bc5ebc9d9d3f04ca84a9fe7c'
         'fd283503a805f81dfd2e12ce5ab91de2'
         '716235f537c5d1e5b06bfc0876c85632'
         '74f8855b74db79fb0bf1ae501610051f'
         'c17ec05382c29728c6232400079412b7'
         'e29ef47a642d11611e2c1d57725b8887'
         'b5379d5650a527443cd88b0da86e7f1e'
         '7179b947d45ae91bd66cf5faa7593ba8'
         'aa4c08a33ea0e3222e2bd2a5660018b3'
         '5ff55bf30cda893a94c60df494bbb1e8'
         'cb36625a118c61d6c8504ce8b69a5059'
         '872c867f6f4e4ad889338e40b5a53d0b'
         '4e7a5a52abf4a36cef2d27aade51f377'
         '1001939c6db069520e7169fc3ecaebce'
         'd1410cb5c3ffa504e458a0b0b7551a6b'
         'e9a24cfaced98881a205e19bb93be1bb'
         '885c3e957448b23c7b15c39e00bc4c43'
         '2c2d2e8a612ef78529879dcb0b881c36'
         'b3f81ee99d4bde621af360d193ab2d0f'
         '875b9a8bdf72831c9610c81ac9a98c92'
         '923a72443fc62f1d222f464f8710ab2a'
         '3ac85f3972c4a35856c104b827531397'
         'f0c01060355e32c330a3bbf8e65aac3f'
         '9786307fb69956944201c9e0f857f95c'
         '6127901718b3e546211bf2fc00f699b1'
         'ef8e5f1366d02fc529571ceac9b7611f')
