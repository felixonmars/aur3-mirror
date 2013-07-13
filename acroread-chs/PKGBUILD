# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Dogukan Korkmazturk <d.korkmazturk@gmail.com>

pkgname=acroread-chs
pkgver=8.1.7
pkgrel=2
pkgdesc="Adobe Acrobat Reader for viewing PDF files. Chinese Version"
arch=(i686 x86_64)
url=http://www.adobe.com/hk_zh/products/acrobat/
license=(custom)
depends=(desktop-file-utils lib32-gtk2 lib32-mesa)
[[ $CARCH == "i686" ]] && depends=(${depends[@]/lib32-/})
provides=(acroread=$pkgver)
conflicts=(acroread)
options=(!strip)
install=acroread.install
source=(http://ardownload.adobe.com/pub/adobe/reader/unix/8.x/8.1.7/chs/AdobeReader_chs-8.1.7-1.i486.tar.bz2
    acroread-lib32.patch
    acroread-scim.patch)
sha256sums=('b4c53b02bce987a4f98a440df11898e59633ed51dc3881e63defe965c5e7aa2b'
    'c0b53e10e7eca16dc6aa21580c34ef934c0c8ac09bf004727371548cdd190d82'
    'bc2e89192c0f42539fa77350757b57d48bc36a93df68c03fb5175590d98900a7')
sha512sums=('f1013b2d75b622db6f752e5ff923649b6111980ba923a5fea7a5425add063f050643daab60cbd017a37e71cd9293579057679f998b914d0a253c321f584b7207'
    'b4097c53afd331782e6253826fd385719f6f468fc720e8b6a8314fdd89a818abae713118fd08023bda6e808af3c25d0a27e03b01f0ee3ad2695229dc809fc8a2'
    'f607c6dc288de120a09c49fb2c54814aac493c1b632d437c2f66e5857f98aa4dc9005ba29f9bd8bf81d8edf8e75a4e308efe9957e1675c1c50e52f6252872c7a')

prepare() {
    cd AdobeReader/
    bsdtar -xf COMMON.TAR
    bsdtar -xf ILINXR.TAR
    sed -i 's|AdobeReader8.png|acroread|' Adobe/Reader8/Resource/Support/AdobeReader.desktop
    [[ $CARCH == "x86_64" ]] && patch -p1 -i ../acroread-lib32.patch
    patch -p1 -i ../acroread-scim.patch
}


package() {
    cd AdobeReader/Adobe/Reader8

    install -d "$pkgdir"/opt/acroread/
    cp -a * "$pkgdir"/opt/acroread/

    install -d "$pkgdir"/usr/bin/
    ln -s /opt/acroread/bin/acroread "$pkgdir"/usr/bin/

    install -d "$pkgdir"/usr/lib/mozilla/plugins/
    ln -s /opt/acroread/Browser/intellinux/nppdf.so "$pkgdir"/usr/lib/mozilla/plugins/
    # Remember to run nspluginwrapper -v -a -i AS USER (not root) to install the 32-bit plugin.

    install -Dm644 Resource/Support/AdobeReader.desktop "$pkgdir"/usr/share/applications/acroread.desktop
    install -Dm644 Resource/Icons/64x64/AdobeReader8.png "$pkgdir"/usr/share/pixmaps/acroread.png
    install -Dm644 Reader/Legal/zh_CN/License.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
