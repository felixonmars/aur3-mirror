pkgname=phpwind-stable
url="http://www.phpwind.com/"
pkgver=8.7
pkgrel=1
pkgdesc="A famous PHP BBS program(utf8 edition).Just use 'phpwind-stable-install <web-server-directory>' to install it"
license=('unknow')
arch=('any')
provides=('phpwind')
conflicts=('phpwind-rc')
replaces=('phpwind-rc')
depends=('php')
source=('http://www.phpwind.com/downloads/forums/phpwind_UTF8_8.7.zip')
md5sums=('6e559dd0ca09f4ec9d6c495f9d87bfde')
optdepends=('mysql: local database'
            'apache: HTTP server'
            'nginx: HTTP server'
            'php-fpm: php support for nginx')
build()
{
cd "$srcdir"
cp -rPp phpwind_UTF8_8.7/upload "$pkgdir"
cd "$pkgdir"
mkdir -m 755 -p usr/share
mkdir -m 755 -p usr/bin
mv upload usr/share/phpwind-stable
a="$(echo -e '\u24')"
cat << EOF > usr/bin/phpwind-stable-install
#!/bin/sh
cp -rPp /usr/share/phpwind-stable/* "${a}1"
[ $? = 0 ]&& echo "Install finished.No error reported."
EOF
chmod 755 usr/bin/phpwind-stable-install
}
package()
{
printf ""
}
