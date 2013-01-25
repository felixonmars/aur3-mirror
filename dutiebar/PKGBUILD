pkgname=dutiebar
pkgver=2013.1.25
pkgrel=1
pkgdesc="Baidu tieba title viewer(CLI)"
arch=('any')
url="http://erhandsome.org/php"
license=('BSD')
depends=('bash' 'grep' 'coreutils' 'sed' 'curl')
package() {
x="$(echo -e '\u24')"
	cd ${pkgdir}
mkdir usr/bin -p
cat << EOF > usr/bin/bar
#! /bin/bash
a=${x}{1:-linux}
b=${x}{2:-20}
curl -s "http://tieba.baidu.com/f?kw=${x}a" | iconv -f GBK -t UTF-8 | grep '<a href="/p/[0-9]*"' | sed 's/<a href=".*j_th_tit">//g;s:</a>::g;s/\t//g;s/&quot;/"/g;s/&lt;/</g;s/&gt;/>/g;s/&amp;/&/g;s/&reg;/®/g;s/&copy;/©/g;s/&trade;/™/g' | head -${x}b
EOF
chmod +x usr/bin/bar
}

