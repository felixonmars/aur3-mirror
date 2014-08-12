pkgname='lua51-systemd'
pkgver='scm_0'
pkgrel='0'
pkgdesc='Lua bindings to systemd'
arch=('i686' 'x86_64')
url='https://github.com/daurnimator/lua-systemd'
license=('MIT')
depends=('luarocks5.1' 'lua51')
source=('git://github.com/daurnimator/lua-systemd')
md5sums=('SKIP')
install='rock.install'
build() {
	cd 'lua-systemd';
	luarocks-5.1 make --pack-binary-rock 'systemd-scm-0.rockspec';
}
package() {
	cd 'lua-systemd';
	luarocks-5.1 --to="${pkgdir}/usr" install --deps-mode=none --keep 'systemd-scm-0'.*.rock
	rm -- "${pkgdir}/usr/lib/luarocks/rocks-5.1/manifest"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
