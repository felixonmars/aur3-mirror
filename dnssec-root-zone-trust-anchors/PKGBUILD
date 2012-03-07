# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Maintainer: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/
# Patches welcome: http://github.com/harvie/archlinux-packages
# Maintainer: m4xm4n <max@maxfierke.com>

pkgname=dnssec-root-zone-trust-anchors
pkgver=2011.06.30
pkgrel=3
pkgdesc='IANA Root Zone Trust Anchors for DNSSEC converted to various formats so they are usable by many applications.'
arch=('any')
license=('Public Domain')
url='https://www.iana.org/dnssec/'
depends=('dnsutils')
makedepends=('sed' 'coreutils' 'gnupg')
_signed_zones=(.) #(bg br cat cz dk edu lk na org tm uk)
_anchor_dir=/usr/share/dnssec-trust-anchors
source=(
	"anchors2ds.sed"
	"https://data.iana.org/root-anchors/Kjqmt7v.crt"
	"https://data.iana.org/root-anchors/Kjqmt7v.csr"
	"https://data.iana.org/root-anchors/draft-icann-dnssec-trust-anchor.html"
	"https://data.iana.org/root-anchors/draft-icann-dnssec-trust-anchor.txt"
	"https://data.iana.org/root-anchors/icann.pgp"
	"https://data.iana.org/root-anchors/icannbundle.p12"
	"https://data.iana.org/root-anchors/icannbundle.pem"
	"root-anchors"
	"https://data.iana.org/root-anchors/root-anchors.asc"
	"https://data.iana.org/root-anchors/root-anchors.p7s"
	"https://data.iana.org/root-anchors/root-anchors.xml"
)



build() {
	cd ${srcdir}

	msg 'Verifying root-zone anchors using GPG'
		echo 'I will import ICANN GPG key now. You should check it and optionaly sign it for future pkg builds.'
		gpg --import icann.pgp
		if gpg --verify root-anchors.asc root-anchors.xml; then
			msg2 'OK!'
			echo
		else
			msg2 'Failed!'
			return 1
		fi;

	msg 'Transforming root-zone anchors for various applications'
	msg2 'to DS format... (unbound,drill,dig,...)'
		_anchor_data="$(sed -f "${srcdir}/anchors2ds.sed" root-anchors.xml | tee root-anchors.key)";
		echo ${_anchor_data}
		echo

	msg2 'to dnsval.conf format... (dnssec-tools)'
		echo "# you can include this file in dnsval.conf using following directive:
# include ${_anchor_dir}/root-anchors.dnsval.conf

: trust-anchor
	${_anchor_data}
;

: zone-security-expectation
$(for zone in ${_signed_zones[*]}; do echo -e "\t${zone} validate"; done)
;" | tee root-anchors.dnsval.conf
	echo

	msg 'Installing anchor files...'
	mkdir -p ${pkgdir}${_anchor_dir}/
	cp -f ${srcdir}/* "${pkgdir}${_anchor_dir}/"

	#msg 'Making /etc/trusted-key.key symlink...'
	#mkdir -p "${pkgdir}/etc"
	#ln -s "${_anchor_dir}/root-anchors.key" "${pkgdir}/etc/trusted-key.key"

	msg 'Installing usefull binaries...'
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/anchors2ds.sed" "${pkgdir}/usr/bin/anchors2ds"
	chmod -R 755 "${pkgdir}/usr/bin"

	msg 'Cleaning...'
	rm -rf "${srcdir}"/*

}

md5sums=('dc7048530480e57f2eade3cd12dfaf39'
         '27bbd7b1e0b0381adddc33da2bfb3241'
         '427766bf91c674c4f0469ed363f207a8'
         'fc244ac431689b6f5be904028c869fce'
         '3cd5b6b9f78658e1a1132fe36ce18273'
         '041a789ee96301623d3e66e4d52c8a0b'
         'b174283d8da2150b9a720814aed0399b'
         '59774aba58dbde1049bdf4722fb4f02c'
         '69e6f9b67e92fbc952d488cc6f67198f'
         'a5612e1b84a75c29b642b9342286c511'
         '4a6eaf38469abd82df5ce3832962ab4f'
         '69e6f9b67e92fbc952d488cc6f67198f')
sha1sums=('535d130c78439146182cd33d3e5f26a6191abeb4'
          '3511892dfb1a701fbcb380d7d287106c05f88bf3'
          'ccd189083713572119635047e3d78ae9a2d9d307'
          '1d7c57b28ec4551361b7b6fc38f7740e8c2626c0'
          '81c1a8a5292938ce858c72abd39e07acd9d4f95c'
          '322f293c4b7a9ca652fbd1b22bac2bfcea12cd10'
          '1ab810120ce23b8d00bc85d23d51a5386beb4574'
          '4c4de880ff9f06e70f72cf66121ecc0849cbd1f5'
          '9bb81768fb3095584096999693418fcdb13d7b9c'
          '9a9fe64e4ef587f4413c1e0ab7655e532de9070f'
          '8e6ff7a90b90c40dc52569e980dde6b04aef7487'
          '9bb81768fb3095584096999693418fcdb13d7b9c')
sha256sums=('94b4370dd436580e8a5fb775e436ef9ff1cafcfb00bb787a8cadef8b3e34ee08'
            '17e0f21c31f811685388b14dcd7c97dcfc92e23b03896827bbc7ff2f0c54c252'
            '401120c1721ba100b2d9abf2d01332399535ba0f9c71dbd9f97232c5ebd608d2'
            'dbf1e6220849f93ceb80b6d247c5a3d42b5c38e053b1a6465e701d3c8f953a8e'
            '328faa824f529f1483f584fbb4b1f83b63f53ae4bad64609bab2009a811172c7'
            '3e9beaaf9bbd1fe78a0d104230cbc04d544e833a2dc6b982992f74a4860a9ae8'
            '0c854f3be5b2e212c276a1b98ce7bf57caf412152c26e667613e63793af4f654'
            'c4a91c4bea6763f4ef05ca92bf74fb41d5583594c04aa999c90a55d710a3e5da'
            'dfb281b771dc854c18d1cff9d2eecaf184cf7a9668606aaa33e8f01bf4b4d8e4'
            '5bffcac53f810c5fb1e1baf543e2de2f10ec99d7f7cddb5f1e47b1e58cf34cfa'
            'd74ca12899a150ea75b537cb77b0e55046cdad495349422fe1d858cc89f21c5b'
            'dfb281b771dc854c18d1cff9d2eecaf184cf7a9668606aaa33e8f01bf4b4d8e4')
sha384sums=('d23aa0cee0c601dac88a418ddb90730bfc12d0b14d7332d1741dd44843a21a89fad6298cce7e4c3fa66d67779844c873'
            '7ff630b8e423534e64b0646ebd2767419a61e2295cd7355e6de7254b7f87456cd9f75f4f01539716589c9a65bb66ff77'
            '65128264d4271ff197368b69bce1df37294f45e324a02289599c13ad920d1acb9fc13be67b64c7b54c305feae30cd270'
            'fb37e1b7130094cffd36e7c6d8e9f3fbd2f1266f759bb453975e4047f71246dd46d556213e913bed6698e45862cd5dc1'
            '3789bf702382ba80dc21cb33db0b9cb2b1fc4dfc91a990b0762fcb9b9b89c184ae3bfe62e18ef7f01c5f35fd2436f090'
            'c1f4e61989c1c6d2571703a66147a93a9f3642c236972c136be9cb410cf09d570d4c960cd515a6ffb24920b58a93f71a'
            '1110c6323fa56ad2bce304992bba69be78a5479e983bdadb0dab92e16ae94993748bfb618eb74ebae0617377e366c18f'
            'ea647918a84e9952ad16cd559f386a47768b91ea22ea33b7218461188400ca3f3fe71dd80d6c096a4aafbf7126666b59'
            'e4e08ece419d2ccb934a930121a8ea3a7f34127dfcc3ac1dda3da4389b1b825fc689dc00dcefb13d749179ac5a497c38'
            '47c1f4243298ce2f5f6234a159b080acdd58d657175300408020e2e064c647ebd3c8110d82700c35a622f96804f48827'
            '417505970bf2245672db2889ffc7a96bbfffa5b4e50144897d1549276ae71508f6f4cf3966b8809bb37101f3b980402d'
            'e4e08ece419d2ccb934a930121a8ea3a7f34127dfcc3ac1dda3da4389b1b825fc689dc00dcefb13d749179ac5a497c38')
sha512sums=('772c3d5f89f75f3629cd52116ffe15355f66de58892dc7d9518275a07f1c27865e3cc1331254918e0edfb7979de471f2641ada7b544d6ec0a95f8cc9c389f370'
            'dd208ee38e7652cbd6796ca1574ada288cb950ec9f39d994e4f32161f1b9b281da1cd8820d7b4727caaeb54c8ae0adcdd130e55f75c48721e899ebfbbaefa3fa'
            '8e47be5054bbb801cb914d94a6f0d1e6b9b2eba387714f011f118bf8af6dacfe24a2dec80525ad005c545fa15fd8413cf90615e6d5c50d7925daa4aefff77112'
            '66a5e48a2a2222bbddb84222c49b5e6cd2e30c4dc56c8ba5be9d0748fb46f71a3c2a82e843a340acbc9ce9a5f655a1695c73d0d127c6dac2099d2303a9057898'
            'df200c6e42924df6813c32a3084a93ec5228a6a04e21e2daf82069d40a390d5a4f3e72c8e55610fda70b01f1ae20dbf2e7e49a7c1d45e9cd145446821a67479f'
            '5fba8334850f2ae753f4f8a30d1e6c62abc341ece2dc83df4bc0f6db2b91ae68942c0d2a38eab3d33b5b91640cd1cf0970777225c15d5f961884c00077d539a2'
            '7689a2304b9ac8875d9c58a4c0facc2718abb7de39af19c8a6c149bfc5fbb80ef23a41828fc79f07b2359290505e22c8ea509ec56d0b1c17212d455badcc2ecf'
            '36ce5025acc447f740222dd5f794fd848540731792441c6e50b0260411ea8d30b7d2b97a53a26d0469f3315d5881acb5e2b92a904413939db9a6b64ffd6e0f2b'
            'bca506c852bc83aa9d04ed0b52bef6d0baec745e466292273d52f49fd73cec73db4c6d55a9921fe086c7edc618f3ab21dc03146b6d617644495b3926e262e572'
            'e9c86b897d7e8edb979cba4bebe353b7c7f21b4061cd6f571c8671b02e73c2ea0b78a980169fa7d40987b9e962a0f1ba17dbb392b5ec6ad14fedce65a139c913'
            '384080488923cd855b6c1f7aaa9021630ab2cce51f0aee3d0561940d2668ee15e612949fe8398e59b4274968f6116e033e8d88ffe8375852864d9dd5f6df4852'
            'bca506c852bc83aa9d04ed0b52bef6d0baec745e466292273d52f49fd73cec73db4c6d55a9921fe086c7edc618f3ab21dc03146b6d617644495b3926e262e572')

