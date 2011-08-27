# Contributor: ragon <frederik.engels24@gmail.com>

pkgname="bukkit-authorize"
pkgver="1.4"
pkgrel=1
pkgdesc="A bukkit port of AuthCraft, for authenticating users"
arch=('any')
license=('NONE') # at least none at the time
url="http://forums.bukkit.org/threads/authorize-authcraft-like-plugin.610"
depends=('bukkit')
makedepends=('unzip' 'wget')
source=(http://greencubes.ru/plugins/authorize/authorize_14.zip)
md5sums=(cda6f0e6a4b95f8fba69abc1887405a0)
build()
{
	mkdir -p $pkgdir/etc/bukkit/plugins/Authorize

	unzip authorize_14.zip

	install -D -m755 $srcdir/Authorize.jar $pkgdir/etc/bukkit/plugins/Authorize.jar
        install -D -m755 $srcdir/Authorize/config.yml $pkgdir/etc/bukkit/plugins/Authorize/config.yml
}
