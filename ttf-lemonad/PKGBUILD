# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-lemonad
pkgver=20130929
pkgrel=1
pkgdesc="Cyrillic and Latin fonts from the project of free fonts"
arch=(any)
url=http://www.jovanny.ru/eng-free-fonts.html
license=(custom:OFL)
makedepends=(unrar)
install=ttf.install
# yeseva one, nixie one, cuprum, neucha, days and numans fonts hosted in google-webfonts, see package ttf-google-webfonts
source=(http://www.exljbris.com/dl/FontinSans_Cyrillic_46b.zip
    https://dl.dropboxusercontent.com/u/3395784/aur/ttf-lemonad/Bender.zip)
_fonts=(20db Airport Bicubik Captcha%20Code Dited epool flow Furore Hardpixel
    Hattori London Metro Molot nobr1 nobr2 nobr3 Otscookie POWERVIEW Prosto
    puzzle suwikisu Unimportant Upheaval Zhizn zopa)
for f in ${_fonts[@]}; do
    source+=(http://jovanny.ru/fonts/$f.rar)
done
sha256sums=('2cc50df02fecac3beb3d66f3f71ce77fa02197839af366f2c15734be2e390e4f'
    '5f214a59208a5d3a7478cf24562f71f711b5684d4ec3e030349fc5f2fc10248c'
    '8ebbdf8707cc6e22e81c99d388cb3491ab25e057b5a0ab1aebd36dfad0bedf7b'
    '49e984c17ae2e33d9e06b57ba3d859f7d127294272d10d5b7143d3a26bbebf4b'
    'f038a9b8c67882c29eca8877b35cfbcf303d8da1c0ab5d28b6d1c51166562415'
    'b87740618de612f6f25d6b73c0319b2a834cdca50c9ce4b8054f378f94ef8d8b'
    'ba5a43a53ea824706f4e4e0441a7e4160758c004b4647ba6de606bd16987de07'
    '2227970dee3a512f55194e8c251f04036622bdb533be41fe657381d883f6187c'
    '6aa3bc1961ef731bbe61c7d4de795adbb62a45a6d7ceb2c2e4d03a713bc47b7d'
    '7caee46853da835387f03c6ac2a0f5dba1d012c6abd6a27eb933eb3aa9c50a27'
    '0e14d68daa6a81e4ab45833d9053995fe45a3a80b1e491a354d6e7f73e678b9c'
    '5df3535738009ffd48ad8656dfd1dea17a2c31757d9219db935d9c328ab4a3ea'
    'e467ab2899c94d690b8f5212f7b4098332fac40881070921723bfabb7c4269b7'
    'c4b8be725247981cb552ce38250b1d01251fa8679747dd7b9a8ca24a98d00cce'
    '1dd46b0977730b0696b94d593d54d1a34b2313e3914c6f3bba7a0adeae6727b0'
    '30c3dd2cbac1db59daff3e0bcccdee7f24841ab5fa104ccb27338c8e97668281'
    '6f7f8c8fb9800ff68a72fa5abceb0f257c5f217feb7ac3ce7df8246e10bc6240'
    '7f45958cc0d8e73109c2f45c7701e186064e6de78e5bd268e8c24eb4380a7898'
    '84aa54c085e9fbb32032f74b4a273c5bcf288883b4bb128bbf94dc80a6c7072c'
    'ca668f3e75df76cd66d54369b6c124e48a3b06ee2925f858fec906bb80362b39'
    'f3f04a90c66cd6edfdbeac3602c522c1d2e48eace37b57afc5dbee1be0950eaf'
    '5e6e3d357d242ac4550a441b68f9f789a6e32314192dad1d8bb8cced75fef8db'
    '3119137e30a0909d02e15ac086566bb538e206df1b10166f0d97e265aec37a73'
    'f27e329413a9e3cfcfea389bc4315ec6f5d5490f8944bac8bdffc2cae65beb52'
    '059ea75cd349bbdf07c90d8e901c364a67e92b2d1abe5793fb51550b8f54f5d8'
    'a056b58affdf0b4bfb87c6da7395efa5d75d0892450d5e42b8386ca7f2c07c06'
    'c741ba57d481a866a8351003e917abd379672546f48627f137201d2754cdcdaf')
noextract=(${source[@]##*/})

prepare() {
    find -name '*.zip' -exec bsdtar -xf '{}' \;
    find -name '*.rar' -exec unrar -y e '{}' \;
}

package(){
    find -name '*.otf' -exec install -Dm644 '{}' "$pkgdir"/usr/share/fonts/OTF/lemonad/'{}' \;
    install -Dm644 OFL.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.OFL
}
