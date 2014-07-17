# Maintainer: Sascha Weaver <wzyboy@wzyboy.org>

cat << EOF

This font family has several variants:

* Multilingual version with Japanese glyphs as default priority
* Multilingual version with Korean glyphs as default priority
* Multilingual version with Simplified Chinese glyphs as default priority
* Multilingual version with Traditional Chinese glyphs as default priority
* Monolingual version with only Japanese glyphs + Latin
* Monolingual version with only Korean glyphs + Latin
* Monolingual version with only Simplified Chinese glyphs + Latin
* Monolingual version with only Traditional Chinese glyphs + Latin

This PKGBUILD will build four monolingual packages.

EOF

pkgbase=adobe-source-han-sans-fonts
pkgname=($pkgbase-jp $pkgbase-kr $pkgbase-cn $pkgbase-twhk)

pkgver=1.000
pkgrel=1
pkgdesc='Adobe Source Han Sans - Religion-specific subsets'
arch=('any')
url='https://github.com/adobe-fonts/source-han-sans'
source=("http://sourceforge.net/projects/source-han-sans.adobe/files/SourceHanSansJP-1.000.zip"
        "http://sourceforge.net/projects/source-han-sans.adobe/files/SourceHanSansKR-1.000.zip"
        "http://sourceforge.net/projects/source-han-sans.adobe/files/SourceHanSansCN-1.000.zip"
        "http://sourceforge.net/projects/source-han-sans.adobe/files/SourceHanSansTWHK-1.000.zip")
noextract=(SourceHanSansJP-1.000.zip SourceHanSansKR-1.000.zip SourceHanSansCN-1.000.zip SourceHanSansTWHK-1.000.zip)
sha256sums=('c5930036660bea22ffceaa9e2df765776494800d330a59be7936ab3c763c4c82'
            '8eed4ad092fcf640e44f73ba510e0ed1c1cabf79776f68d02820734bbba21cf8'
            '88117aa8f8b4ab65d6f7a919a5e1b06d6c00f75b1abecccf120246536123754d'
            '2371a726757a51322243b1ed7a9fde562621b0813b5e6d6443e06847ad7bbd20')
license=('apache')
depends=('fontconfig')
install="fonts.install"
PKGEXT='.pkg.tar' # because XZ compression is awfully slow

_jp=(
SourceHanSansJP-Bold.otf
SourceHanSansJP-ExtraLight.otf
SourceHanSansJP-Heavy.otf
SourceHanSansJP-Light.otf
SourceHanSansJP-Medium.otf
SourceHanSansJP-Normal.otf
SourceHanSansJP-Regular.otf
)
_kr=(
SourceHanSansKR-Bold.otf
SourceHanSansKR-ExtraLight.otf
SourceHanSansKR-Heavy.otf
SourceHanSansKR-Light.otf
SourceHanSansKR-Medium.otf
SourceHanSansKR-Normal.otf
SourceHanSansKR-Regular.otf
)
_cn=(
SourceHanSansCN-Bold.otf
SourceHanSansCN-ExtraLight.otf
SourceHanSansCN-Heavy.otf
SourceHanSansCN-Light.otf
SourceHanSansCN-Medium.otf
SourceHanSansCN-Normal.otf
SourceHanSansCN-Regular.otf
)
_twhk=(
SourceHanSansTWHK-Bold.otf
SourceHanSansTWHK-ExtraLight.otf
SourceHanSansTWHK-Heavy.otf
SourceHanSansTWHK-Light.otf
SourceHanSansTWHK-Medium.otf
SourceHanSansTWHK-Normal.otf
SourceHanSansTWHK-Regular.otf
)

_all=(${_jp[@]} ${_kr[@]} ${_cn[@]} ${_twhk[@]})

function _package {
    cd "$srcdir"

    case "$1" in
        $pkgbase-jp)
            fonts=(${_jp[@]})
            unzip -j SourceHanSansJP-1.000.zip
            pkgdesc="Adobe Source Han Sans - Japanese OpenType fonts";;
        $pkgbase-kr)
            fonts=(${_kr[@]})
            unzip -j SourceHanSansKR-1.000.zip
            pkgdesc="Adobe Source Han Sans - Korean OpenType fonts";;
        $pkgbase-cn)
            fonts=(${_cn[@]})
            unzip -j SourceHanSansCN-1.000.zip
            pkgdesc="Adobe Source Han Sans - Simplified Chinese OpenType fonts";;
        $pkgbase-twhk)
            fonts=(${_twhk[@]})
            unzip -j SourceHanSansTWHK-1.000.zip
            pkgdesc="Adobe Source Han Sans - Traditional Chinese OpenType fonts" ;;
    esac

    # Prepare destination directory
    install -dm755 "$pkgdir/usr/share/fonts/adobe-source-han-sans"

    # Install fonts
    for font in "${fonts[@]}"; do
        install -m644 "$font" "$pkgdir/usr/share/fonts/adobe-source-han-sans"
    done
}

for package_name in ${pkgname[@]}; do
    eval "function package_$package_name() { _package $package_name; }"
done
