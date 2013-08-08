# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname='foldingathome-gpu'
pkgver='6.41'
pkgrel='10'
pkgdesc='Folding@Home GPU client with Wine wrapper script, systemd support, and multi-GPU control.'
arch=('i686' 'x86_64')
url='http://folding.stanford.edu/'
license=('custom')
depends=('wine')
[[ $CARCH == 'x86_64' ]] && depends+=('lib32-nvidia-utils') || depends+=('nvidia-utils')
source=(
	'http://www.stanford.edu/group/pandegroup/folding/release/Folding@home-Win32-GPU_XP-641.zip'
	'https://dl.dropboxusercontent.com/u/24716740/mirror/libcudart.so.3.xz'
	'https://dl.dropboxusercontent.com/u/24716740/mirror/libcufft.so.3.xz'
	'https://github.com/Shelnutt2/cuda-wine-wrapper/raw/master/cudart/cudart.dll.so'
	'https://github.com/Shelnutt2/cuda-wine-wrapper/raw/master/cufft/cufft.dll.so'
	'foldingathome-gpu-wrapper'
	'foldingathome-gpu@.service'
	'client.cfg'
	'LICENSE'
)
backup=('etc/foldingathome-gpu/client.cfg')
md5sums=(
	'9ebca50f5ac714ce8fda5355a637027b'
	'2193a352d955f07e6410700e30d6b40a'
	'73f44019fbf44a068a9702a3c91f4065'
	'c8ab6792ccc8f1f07c2af288060e96c1'
	'6f24dab03758bc0b8ee89091a77ba284'
	'f2b7eff2fa52b9b3b31dd793bcb18b29'
	'49111f41b9e9dd612136fc07cba2d564'
	'bb9436249bc4916ee167fbb8447fae42'
	'e7a1543a70645d60c3a0c03f973db2c5'
)
install='foldingathome-gpu.install'

package() {
	mkdir -p "$pkgdir/var/lib/foldingathome-gpu" "$pkgdir/opt/foldingathome-gpu"

	install -D \
		"$srcdir/Folding@home-Win32-gpu.exe" \
		"$srcdir/cudart.dll.so" \
		"$srcdir/cufft.dll.so" \
		"$srcdir/libcudart.so.3" \
		"$srcdir/libcufft.so.3" \
		"$pkgdir/opt/foldingathome-gpu"

	install -D "$srcdir/foldingathome-gpu-wrapper" "$pkgdir/usr/bin/foldingathome-gpu-wrapper"
	install -Dm 644 "$srcdir/foldingathome-gpu@.service" "$pkgdir/usr/lib/systemd/system/foldingathome-gpu@.service"
	install -Dm 644 "$srcdir/client.cfg" "$pkgdir/etc/foldingathome-gpu/client.cfg"
	install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
