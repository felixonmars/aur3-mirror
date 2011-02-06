pkgname=giengerldap_auxprop
_cyrus_sasl_ver=2.1.23
pkgver=1.2.2
pkgrel=1
pkgdesc="ldap auth for SVN"
arch=(i686 x86_64)
url="http://southbrain.com/south/2008/06/writing-a-cyrus-sasl-ldap-auxp.html"
license=('GPL')
depends=()
makedepends=()
options=(!distcc)
source=(http://southbrain.com/software/ldap_auxprop/giengerldap_auxprop-$pkgver.tar.gz \
	ftp://ftp.andrew.cmu.edu/pub/cyrus-mail/cyrus-sasl-${_cyrus_sasl_ver}.tar.gz)
md5sums=('636e8261198ea69372058e858fc496e9'
         '2eb0e48106f0e9cd8001e654f267ecbc')

build() {
  cd "$srcdir/cyrus-sasl-${_cyrus_sasl_ver}"

  sed -i 's|#elif WITH_DES|#elif defined WITH_DES|' plugins/digestmd5.c

  [ $NOEXTRACT -eq 1 ] || ./configure --prefix=/usr --with-ldap=/usr --with-saslauthd=/var/run/saslauthd --with-des=/usr
  make || return 1

  cd "$srcdir/giengerldap-$pkgver"

  sed -i "s#CYRUSSASLPATH=.*#CYRUSSASLPATH=$srcdir/cyrus-sasl-${_cyrus_sasl_ver}#" compile

  patch -p0 giengerldap.c <<EOF
119a120,125
>   char *_at = strchr(username, '@');
>   if(_at != NULL)
>   {
>     *_at = 0;
>   }
> 
EOF

  ./compile && make plugindir=$pkgdir/usr/lib/sasl2 install
}
