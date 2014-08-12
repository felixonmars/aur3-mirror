pkgname='lua-systemd'
pkgver='scm_0'
pkgrel='0'
pkgdesc='Lua bindings to systemd'
arch=('i686' 'x86_64')
url='https://github.com/daurnimator/lua-systemd'
license=('MIT')
depends=('luarocks' 'lua')
source=('git://github.com/daurnimator/lua-systemd')
md5sums=('SKIP')
install='rock.install'
build() {
	cd 'lua-systemd';
	luarocks make --pack-binary-rock 'systemd-scm-0.rockspec';
}
package() {
	cd 'lua-systemd';
	luarocks --to="${pkgdir}/usr" install --deps-mode=none --keep 'systemd-scm-0'.*.rock
	rm -- "${pkgdir}/usr/lib/luarocks/rocks-5.2/manifest"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
