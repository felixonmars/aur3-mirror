# Maintainer: Flow
pkgname=keepass-il8n
pkgver=2.27
pkgrel=1
pkgdesc="Language packs for Keepass"
license=('GPL2')
depends=("keepass")
conflicts=(keepass-de,keepass-fr,keepass-it,keepass-lt,keepass-ru,keepass-zh_cn)
_languages=Chinese_Simplified,Czech,Danish,Dutch,French,German,Hungarian,Italian,Japanese,Korean,Latin,Lithuanian,Norwegian_NB,Polish,Portuguese_BR,Portuguese_PT,Russian,Slovak,Spanish,Swedish,Turkish,Ukrainian,Vietnamese
url="http://keepass.info/translations.html"
eval source=("http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-{${_languages}}.zip")
arch=(any)

md5sums=('e32c777814c1778569f63cec543ca60b'
         '676f570a9497e0bf5c3e465ae1eb3183'
         '4371906bb7ebec3fa7ed6238d98139c0'
         'e37774b1755932a0649140810b2f6ee2'
         'b9b483c77a5dbb22bcc0abfdb0079f6c'
         '317657074ca679868bc05a2a9ae102fc'
         '707669ea80d03a272f1b738bd0d9b414'
         '6395c52a3e3483bc27914fcbc5b12304'
         'cffc23be0cfbf706aed6692beb4bf08b'
         '807780ded2778d58bde95280ddf1c1e8'
         'bde60e6d7d32aee3fd55b2d4de8bdc65'
         '91746f6ad97aa09cad8dde26326fc250'
         '9efb459c341d8d7f388b6e55b9b79f00'
         'dbd5c4b2f2cc43e7ba9ae7de183c311a'
         'bf9be8d3ff48c05bd2aa86ff8a28fae8'
         'f564f4d11af369aee6b04ac5705c22db'
         'f6b7807672574533b5219c151aee9e73'
         '7570bf1aa1e5f4a46ce092dc9f96549f'
         '29e0a3f7262d531426d1dc5e5bf3e92f'
         '6563d674285b7845d2a64477c61aceeb'
         '3287c663a431910f54194d1843329376'
         'bdf3f194ddfe33b967a596fc02227406'
         'be4576418b73b132f61b6eaf176bdf62')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   for lang in $(echo "${_languages}" | sed 's|,| |g'); do
      install -D -m 644 ${lang}.lngx "${pkgdir}"/usr/share/keepass/${lang}.lngx
   done
}
