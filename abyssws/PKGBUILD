# Maintainer: Ruben Reyes <ruben at losreyes dot us>
# Contributor: Roman Kyrylych <roman@archlinux.org>

pkgname=abyssws
pkgver=2.9.0.1
pkgrel=1
pkgdesc="Abyss Web Server X1 - a compact full-featured web server"
arch=('i686' 'x86_64')
url="http://www.aprelium.com/abyssws/"
license=('custom')
depends=('glibc')
backup=('opt/abyssws/abyss.conf' 'etc/conf.d/abyssws.conf.d')
_lurl=http://www.aprelium.com/abyssws/languages/a/
source=(http://www.aprelium.com/data/abwsx1.tgz
    $_lurl/ar.lng
	$_lurl/bg.lng
	$_lurl/cz.lng
	$_lurl/de.lng
	$_lurl/dk.lng
	$_lurl/en.lng
    $_lurl/es.lng
	$_lurl/fr.lng
	$_lurl/gr.lng
	$_lurl/hr.lng
	$_lurl/hu.lng
	$_lurl/id.lng
	$_lurl/it.lng
	$_lurl/jp.lng
	$_lurl/mk.lng
	$_lurl/ms.lng
    $_lurl/nl.lng
	$_lurl/nn-no.lng
	$_lurl/no.lng
	$_lurl/pl.lng
    $_lurl/pt-br.lng
	$_lurl/pt.lng
	$_lurl/ru.lng
	$_lurl/sl.lng
    $_lurl/sv.lng
	$_lurl/tr.lng
	$_lurl/zh-cn.lng
	$_lurl/zh-tw.lng
    'abyss.conf'
	'abyssws.service'
	'abyssws.conf.d')

md5sums=('0581877bcd1ba9b59092ec4d23f84f5f'
         '9acc9ac324872ab6e7b8309e6460d741'
         '7d0d16ef1329271af6669e497dd010aa'
         'b7545f4fdbbe2962919c499e9258b446'
         'ff562d8113c393728b4f80a4be004d61'
         '3ded66c83d624f225befca9808ba4677'
         'd212694cb63a9c29bb7eab5ab053fb36'
         'e1b2cd53d79fdfb46e430cd9f98b4a41'
         '3ac9bcd72d854a91a00a45bb7ba9285e'
         '843ee1cfb181f2c498c41323b4a98a6f'
         'ca7f4b91670994bd2181dcb658f45c81'
         'd30ecd91414b2a6129aae5730fbfb64e'
         '3c9fd8471ca043335fb7b3cbdac0ef40'
         '3871d53f862e4c656fc4a24de19eac10'
         '5572871c8bd43c932d5b7e72c54233b8'
         '0b52c44befcf96a7b9eb14683c967b4d'
         '1644464141ab4b690e640dfef2f9b56f'
         'd4aa13cb1527bc3fba9ef145ce5c03e6'
         'adbe02b4f298f28278c5f344c9480f27'
         'dc732eac9a34b23b6c71714cf4d0b54e'
         '98754405ca34d509b54c1ee2cb9cd54a'
         '77fc3de4e178af4c256b6c11116db602'
         'adbdec30b1b804545b79b439f52b7a0e'
         'fcd4dd62155723baee40885ec3c32c50'
         '9c6c569b114e4919f6e84fbd7f663d54'
         'f3a3ac32f4ce49ccd01ef5cabe9ae319'
         'b9309f3458f15d84c8485715e27ad679'
         'b9a4567de4433ddbbc3767f0175f4448'
         'ff3bb82cb25e14c34647de72b1992f64'
         '7eff46b7e04f9a2ec13d87c873421283'
         'b4133e6b0152ac7658bfc615e67cc66f'
         '92c9079247c1ea79506361c82216bbdb')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/opt
  cp -Rp abyssws ${pkgdir}/opt
  install -m644 abyss.conf ${pkgdir}/opt/abyssws/abyss.conf
  install -Dm755 abyssws.service ${pkgdir}/etc/systemd/system/abyssws.service
  install -Dm644 abyssws.conf.d ${pkgdir}/etc/conf.d/abyssws.conf.d
  install -Dm644 *.lng ${pkgdir}/opt/abyssws/lang/
  install -Dm644 ${srcdir}/abyssws/license.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  rm ${pkgdir}/opt/abyssws/{Installation\ Instructions.html,license.txt,autostart-setup}

  if [[ "$CARCH" == 'i686' ]]; then
  rm ${pkgdir}/opt/abyssws/abyssws-x64
  mv ${pkgdir}/opt/abyssws/abyssws-x86 ${pkgdir}/opt/abyssws/abyssws
  else
  rm ${pkgdir}/opt/abyssws/abyssws-x86
  mv ${pkgdir}/opt/abyssws/abyssws-x64 ${pkgdir}/opt/abyssws/abyssws
  fi
  
  rm -rf ${pkgdir}/opt/abyssws/htdocs
}