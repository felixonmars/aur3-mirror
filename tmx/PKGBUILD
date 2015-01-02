# Sébastien Leblanc <seb@sebleblanc.net>

pkgname=tmx
pkgrel=2
pkgver=20141228
pkgdesc='A tmux wrapper/helper (from the Arch Wiki)'

url="https://wiki.archlinux.org/index.php/Tmux#Clients_simultaneously_interacting_with_various_windows_of_a_session"
depends=(tmux bash grep)
arch=any

source=(tmx)

md5sums=('425b11565203a6f80cc4115e5e053706')
sha256sums=('1e43dcbb3a146923f0a4491a6db5ba1eac56e63cdcbc01bd2fc6c8887b5ac8ae')

# Allegedly public domain. Original source: http://forums.gentoo.org/viewtopic-t-836006-start-0.html
license=unknown

package(){
	install -Dm755 "$srcdir"/tmx "$pkgdir"/usr/bin/tmx
}
