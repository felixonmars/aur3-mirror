# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-kde-i18n
pkgver=34.0.5
pkgrel=3
pkgdesc="Language pack for Firefox KDE"
arch=('any')
url="https://www.mozilla.org/firefox/"
license=('MPL' 'GPL')
depends=("firefox-kde>=$pkgver")
makedepends=('zip' 'unzip')
pkgname=()
source=()
_url=http://download.cdn.mozilla.net/pub/firefox/releases/$pkgver/linux-i686/xpi
_languages=(
  'ach    "Acholi"'
  'af     "Afrikaans"'
  'an     "Aragonese"'
  'ar     "Arabic"'
  'as     "Assamese"'
  'ast    "Asturian"'
  'be     "Belarusian"'
  'bg     "Bulgarian"'
  'bn-BD  "Bengali (Bangladesh)"'
  'br     "Breton"'
  'bs     "Bosnian"'
  'ca     "Catalan"'
  'cs     "Czech"'
  'csb    "Kashubian"'
  'cy     "Welsh"'
  'da     "Danish"'
  'de     "German"'
  'el     "Greek"'
  'en-GB  "English (British)"'
  'en-US  "English (US)"'
  'en-ZA  "English (South African)"'
  'eo     "Esperanto"'
  'es-AR  "Spanish (Argentina)"'
  'es-CL  "Spanish (Chile)"'
  'es-ES  "Spanish (Spain)"'
  'es-MX  "Spanish (Mexico)"'
  'et     "Estonian"'
  'eu     "Basque"'
  'fa     "Persian"'
  'ff     "Fulah"'
  'fi     "Finnish"'
  'fr     "French"'
  'fy-NL  "Frisian"'
  'ga-IE  "Irish"'
  'gd     "Gaelic (Scotland)"'
  'gl     "Galician"'
  'gu-IN  "Gujarati"'
  'he     "Hebrew"'
  'hi-IN  "Hindi (India)"'
  'hr     "Croatian"'
  'hu     "Hungarian"'
  'hy-AM  "Armenian"'
  'id     "Indonesian"'
  'is     "Icelandic"'
  'it     "Italian"'
  'ja     "Japanese"'
  'kk     "Kazakh"'
  'km     "Khmer"'
  'kn     "Kannada"'
  'ko     "Korean"'
  'lij    "Ligurian"'
  'lt     "Lithuanian"'
  'lv     "Latvian"'
  'mai    "Maithili"'
  'mk     "Macedonian"'
  'ml     "Malayalam"'
  'mr     "Marathi"'
  'nb-NO  "Norwegian (Bokmål)"'
  'nl     "Dutch"'
  'nn-NO  "Norwegian (Nynorsk)"'
  'or     "Oriya"'
  'pa-IN  "Punjabi"'
  'pl     "Polish"'
  'pt-BR  "Portuguese (Brazilian)"'
  'pt-PT  "Portuguese (Portugal)"'
  'rm     "Romansh"'
  'ro     "Romanian"'
  'ru     "Russian"'
  'si     "Sinhala"'
  'sk     "Slovak"'
  'sl     "Slovenian"'
  'sq     "Albanian"'
  'sr     "Serbian"'
  'sv-SE  "Swedish"'
  'ta     "Tamil"'
  'te     "Telugu"'
  'th     "Thai"'
  'tr     "Turkish"'
  'uk     "Ukrainian"'
  'vi     "Vietnamese"'
  'xh     "Xhosa"'
  'zh-CN  "Chinese (Simplified)"'
  'zh-TW  "Chinese (Traditional)"')
sha256sums=('c1b10d626544efbbf8c4b7ab50e5f2bd7a3d83a32de8c7d1efbf428ace723a6f'
            'b87c60c2b2ebddadb4fc1cb74da9fdb1c1d2fd4f45c5f3995a8e3393941003d4'
            '5c474b70d902785a9be3b0ba4de0e651d581139a7a8a7fae3f0efb2884810b42'
            '965fdd01c0402f2fda078e7d079776f79b602e837a82bfd3907f6532d6c605f8'
            '837029e6b447809d794f557c0ed072f4d6f99de3cc84febb4bce108489756af2'
            'f051be533973f11fc2e9347c6d5ac858cc4404a5b598a5d35cc37e57fbd16147'
            'addcdc6917742cd752074a520aa5c6f7b4f6efa9a1a67c77fb86dadcff284744'
            '65b9550fa493dc4df5cdf0cbff1e63113b19baa2189679de7c0390ed0f8a2997'
            '3b7979586bbbaf79049eda1ee513081ed65b4429547136612d92db01cb4e10a2'
            '390ac296038947ec8b8251102f2da2713c547abee17361c8371f5f6dab99bd60'
            'b49ebf6396762c381f144719fc318dd59e05681955e010e113d429e310673d32'
            'f0cc5714a71ea6a2bebe79d34e069feebe07020d68ef8f4f9d0ff26d476b4cd4'
            '57750eabfe173be598184e60a800d76be899b6627305b3c9a0c0877fcf020ff5'
            '11fa7ac9db4a634e622b91d4df7d03871405636cf93ecc05d5cf8d4320fc9038'
            'b57fe273431424455011d90759f06d9d402f694d3b597feb03352f7f8045e16b'
            '9da0fca885a093f62913e87f20695c41d4af8a91be1a919401f46195070beaaf'
            '8f396cf405ddd30d3164eea4e06234ee47bd28be0bf635f18410a1dfdff37cd9'
            '5ca3ea90c3657e1daf1468178e27f319373416f920fc107a3378472c37f324f6'
            '79ac586fb2bb74ba508e96b00307a197140aeb2e5ed722dff1e1572dc238fc4b'
            'd1b97184f6fe8461c41bc98e089fe25951b3caec93957af1bfec81cddd824ac3'
            '0d20efecb88f0108264de7e175c858e73bb5e3e4fceb97359cf996f3e2f92d7f'
            '5871dfd97e4cf8609f28b341d80dc24a268499010dc724a4da2d4a3766a9c04b'
            '2ab230d547c1863d67d20d32737aed64469ada26b9ddf0e7d802a148afd0f0ec'
            '04795ae3563b19a1acac8093e882df78b082a4172142f8eb10e46e317ce46703'
            '9b93f11b11bb99689c790e5bf1bb4b30a07eeee7a48566d714f155b7eff1cbba'
            'd4572ef9c2283141c1ca7ac10a509a0e2398290b465ecc770dbd792948270bea'
            '8b5c6a40aef45c60d082a0852eb13028de89b663573125c28a201a295557e845'
            'd5dd6cbdb7bc71ed1bb0d4e20c9866710f73ef6e04095e62eeb0ba8017168af1'
            '27e51fa1f28eccc9f382dd81c3fb1e3f9570579dd8e43a6e23393d9ee6a5ad36'
            '2cc17d3a4619c7ce2f0ac986ac97b0a33b0e2df9d93ddd11884f4a919b2b24ec'
            '537a0334bf0dbaa188e8cf92016593ce8f05747b22c71c8640494190535c26e6'
            '38c50ff5d38c583d9e642794c8b6cc67f778fd00fe6202ed7ea6f714d880de92'
            '6995c0a461d35e86fd9acf9d770897ea5785508629f591ae673b4ae1fd2d1303'
            '7ae23504738b022ddd96d1b8161ec9b047f274eb830928c80d50f0600b99c837'
            'b031b9e2b124ede4d2fcc2005967fc25fa87245a6f99d7896b67e5d16a7b55d7'
            'cfb2a5cfa934c3c5e9a4e4149257a969ea6a1bc44edc933287876928c6305e9c'
            '942efdb3e6d69c834ad78664d427ec00367d9723ea923396661deb5e8261dbe0'
            '71648e5987e996cd750774074bbb37970c97222dd66fe7e38e4e27ae4b3d615f'
            'fbb6d3320c37989ba34643b487b0eee5d38773e28e22082e72d328ab55e00196'
            '94ba0fe57883987090504d7f54b750bd5d353df7673f76560e04ef5d8a13cb05'
            '7d240d622ef7199c0b6540e9c20ad5a24ec571f80b4bb2e91dc544cb9b1837b7'
            '5447aae4599cec9fb2e1ce64dc951a3b7da7c42318fed50019de0a2332be8260'
            '243aeb5dd950996d4043ab79eddb7854c2a3b2096c9a4b1fd3511264a865af46'
            '56d697fb11893bfd76cec1feca093d8b0c35f22ef5aef1b6eb3d3360c7c8a1ae'
            'ff9a4599d8a5aeccbdc38c2bba682863ff00eddeb4745ccf3a85bcc77d78447b'
            '7f1e18d111b1184d51923fc3c0d736c8392f53bbcd5ac8fef2eadbf6418521e2'
            '01b7bb31dab09bd5e5709d6ae7203f2984d9f79bc7806ce815e74cdb67d25e83'
            '0d15339e11189e9645218fc12488d31421802661628da4299342ef8a887c1a94'
            '02ab07dec0b2f4642298af1cb7bf9553b6aad54606ab084e73abfc393fb1c7ba'
            '6e0d21c3f0a9f8bc088e29628e70ceaebd462aebb137be77c4891322b902acec'
            '2c4beef192e5d93d0658eb1e6b19aa4ab4395a42f3bbda27385fde27de1347e2'
            '901bebd8b6cec8f63b7abaef24fed3d4e6b07770be3293fe90ab087663017dfd'
            '250112d07bdbd088a26b43ad790df023c12eb21d3ea4293ff64dac11986a8859'
            '44f799b07a514b6560f35ff1986c5cabfec2d1aa646975d67edda5aabeff9b18'
            '100d6727557a2653947763f7ee14b7f2219ab6d2574ace9a39faa9f1b5981ffe'
            '67233ac417c8bd7e4aede62b428ba923d60f2eb600be6c21829f117d017d1570'
            '4dcea964a93c47a4eefe043f901060e943291a5e234c96e25d72dd68331ff637'
            '3c4e60fddb27343bdeb25039bb4a97c401a1182f3c158316873e0f6c0bbd45ed'
            '064873374bc56deb6dca6dfadcaefb8291b267454e0530de0b6d826a8493fd11'
            'e8627454a0c351564907786205a259dc2c8d26cbf640843a46d49f81b9870460'
            'd87cda6f9ac01ba7d50237a6f43c0fccb53a28a882044b1b6830660a5d32fc81'
            'def2e908055bda9749cb492515d517dfb47992894f52ced23ee8c5fec938f2bd'
            '92a5e4c4410e270f1b91d8c9ee931e299a29ad50aaa088effb1f0daaa736d298'
            '92d3dfd98e00fdddc2fbfed302b00499899f97a2f1d30dcc48a77ce6b4c9b5aa'
            '999317b72e7d1607d10c6aa75ac50547eacf2f688d7cfaac3ca2830000033eb8'
            'e10e91bd394fd5d1c9f996cc88208b22810fe3d9fad18982c911f465b0b498dc'
            'b4c6ddfabef80fa5c31e5b97584ce50a5f77739e9a5a3e1da3380febe9bbf194'
            '0afcf02442b83320e233ef56f2e682193d2b46576b15bb1d4a7545247892219e'
            'b299df8e0f238b2178b30d11cdc9dbd0140ca50e9785bfaf76a98f259f9878c5'
            'a1c5e558959add0a63372ffd94b4eff99fb604f4e3c77689fbf94631ec631813'
            '181028e01101ae6b7e17547d7410f9e04a51e56563ee72aec3420f2eaa993444'
            'f1248f5527f19b3f27b766abb1a00b7d504a42a95cbf2249457b340ca7ec150e'
            'b781704a029bc290f2ec0f9e58c0deea742ef8a5a33316c87f8552e9d7fe3739'
            '39fca86a053b8685d4ce046ae3570cff97bca878ced5a7a1abfe0830e326a36d'
            '2233ec3f8056b75cc4e3f86c56e1f8249eab13e0c4846144586d5e372f20dbb7'
            'b7c3b67941dcd36e69320600a16df27f31e353fad632c206f35d270df5b529cf'
            'aa869c44465216a8a06d35edf21fc3c58d56d545824927b0afa4a476cd464068'
            '14a99c1775a1133bc9ce8b8b84d5cd078c6752cadc55cdeb02d09dafbd943148'
            '076bc14915f6042c6aeb005fe4791ffe84638d64c2031e608c56d1e94f8560e1'
            'c84f8347289a6d26811686688b38dddb3bf54d2b228b1d31a6b4317ce78375c0'
            '6f768807a6e5ee39679276f803e302b996327e60ef6d4811c1e7913eee968818'
            '05cc953a828459e84372d2fdda480995865b2bae71fc5273b4a64975f6626c8d'
            '109010772bdeb83a0dd16142d6d644aadbdb6c29561f8a49dabc4841790c87a6')

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-kde-i18n-${_locale,,}
  
  pkgname+=($_pkgname)
  source+=("firefox-i18n-$pkgver-$_locale.xpi::$_url/$_locale.xpi")
  eval "package_$_pkgname() {
    _package $_lang
  }"
done

# Don't extract anything
noextract=(${source[@]%%::*})

_package() {
  pkgdesc="$2 language pack for Firefox"
  __locale=$1
  conflicts=("firefox-i18n-${__locale,,}")
  install -Dm644 firefox-i18n-$pkgver-$1.xpi \
    "$pkgdir/usr/lib/firefox/browser/extensions/langpack-$1@firefox.mozilla.org.xpi"

  # Fix a few broken langpacks
  # https://bugzilla.mozilla.org/show_bug.cgi?id=832060
  if in_array $1 bg csb; then
    pushd "$pkgdir/usr/lib/firefox/browser/extensions" >/dev/null
    unzip langpack-$1@firefox.mozilla.org.xpi install.rdf >/dev/null
    sed -i '/./,$!d' install.rdf
    zip -u langpack-$1@firefox.mozilla.org.xpi install.rdf >/dev/null
    rm install.rdf
    popd >/dev/null
  fi
}