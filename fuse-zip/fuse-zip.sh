function fz() {
	FILE="$*"
	dir="${FILE}.d"
	test -d "$dir" || mkdir "$dir"
	fuse-zip "$FILE" "$dir"
	cd "$dir"
}

function fuz() {
	FILE="$*"
	dir="${FILE}.d"
	fusermount -u "$dir"
	rmdir "$dir"
}
