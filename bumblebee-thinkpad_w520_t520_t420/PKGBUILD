pkgname="bumblebee-thinkpad_w520_t520_t420"
pkgver="3.0"
pkgrel="2"
pkgdesc="Bumblebee power management scripts for the Lenovo ThinkPad w520, t520, and t420"
arch=("i686" "x86_64")
license=("GPL")
depends=("bumblebee")
url="https://lists.launchpad.net/hybrid-graphics-linux/msg01387.html"
install=("bumblebee-thinkpad.install")
source=("cardoff"
        "cardon"
        "bumblebee-thinkpad.install")
sha512sums=('b15de2f1bffb48fddd16860d23b7119ded2ba01ce60e877c87978787c0fda5ac4981a89912594797e09e1b6795a017c81b67e53d7701682196cb9c86b3ece244'
            '8ddf63e39e3caedc933d09f2daa5c79de982f0224d6c7c7d31cc37ab3f808ad342dd0eb67beedc23e753d323a08d8c8c9b06994641f6b001363ced5034a0a709'
            '1be6396de8c7f2ea610755c8f0d27164abcbce3b23f2f1eec78226071ea25e452d0f068ca38c340e622ea4273c8cb3e4d307c3a663553c2eb4f58c7de5016360')

package() {
	cd "${srcdir}"
  install -d -m755 "${pkgdir}/etc/bumblebee/"
  install -m644 cardoff "${pkgdir}/etc/bumblebee/"
  install -m644 cardon "${pkgdir}/etc/bumblebee/"
}

# vim:set ts=2 sw=2 et:
